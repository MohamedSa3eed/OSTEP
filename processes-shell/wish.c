#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

#define SUCCESSFUL_END 0
#define FAILURE_END    1
#define MAX_PATH       4096

char *paths[100]={"/bin/","/usr/bin/"};
int nOfPathes =2;
char * arrayOfTokens[100];
int indx =0 ; // for the number of tokens 
int childsPid[100];
int nOfChilds = 0 ;

void getTokens(FILE *); //accepts a file as an input and converts it into separated commands stored in arrayOfTokens 
void execCommand(); // executes the next command in arrayOfTokens 
int commandHasRedirection(char *arr[] , int start); // check if the command has redirection '>' 
void error(); // print the error msg in stderr 

int main (int argc, char *argv[])
{
	if(argc == 1) //interactive mode 
	{
		getTokens(stdin); // the input file here is the stdin (the commands that user types)
	}
	else if (argc == 2) //batch mode
	{
		FILE *input = fopen(argv[1],"r"); // the file that the shell was executed with 
		if(input != NULL) // check if the file cannot be opened
		{
			getTokens(input);
		}
		else
		{
			error();
			exit(FAILURE_END);
		}
	}
	else //throw an error 
	{
    error();	
    exit(FAILURE_END);
	}
	return 0;
} // end of main 

void getTokens(FILE* input)
{
	while(1) //the shell must be waitting for an input 
	{
		if(input == stdin) // interactive mode
			printf("wish> "); //the shell prompt
		int temp = indx;
		indx =0 ;
		char *original;
		size_t len = 0 ;
		if(getline(&original,&len,input)==EOF)  // reda utill end of file 
			exit(SUCCESSFUL_END);
		unsigned long long original_size = strlen(original); 
		char *modified = (char *)malloc(sizeof(char)*original_size*6);
		int shift  =0;
		if(!(strcmp(original,"&\n"))) //skip this input
			continue;
		for(int i = 0 ; i<original_size ; i++ )
		{
			if(original[i] == '>'|| original[i] == '&' || original[i] == '|') //check for special signs //** TODO : pipe **//
			{
				modified[i+shift]=' ';
				shift++;
				modified[i+shift]=original[i];
				i++;
				modified[i+shift]=' ';
				shift++;
			}
			modified[i+shift]=original[i];
		}
		char *token;
		while( (token = strsep(&modified," \n")) != NULL ) //remove white spaces and newlines
		{	
			if(!strcmp(token,"&")) // check for multiple commands
			{
				arrayOfTokens[indx] = NULL ;
				indx++;
			}
			if(memcmp(token,"\0",1)) //not equal  (not a null input)
			{
				arrayOfTokens[indx] = token;
				indx++;
			}
		}
		for(int i = indx ; i < temp ; i++) // removing executed commands 
		{
			arrayOfTokens[i]=NULL;
		}
		execCommand(); // execute the token commands 
		free(modified);
		for (int x = 0 ; x<nOfChilds ; x++ ) // wait for the child processes
		{
			int stat;
			waitpid(childsPid[x],&stat,0);
		}
	}
}

void execCommand()
{
	for(int i =0 ; i<indx ;i++) // itrate the arrayOfTokens 
	{
		if (!strcmp(arrayOfTokens[i], "exit")) // special command 
		{
			if(arrayOfTokens[i+1] == NULL) // for a test case :"
			{	
				exit(SUCCESSFUL_END);
			}
			else
			{
				i++;
				error();
			}
		}
		else if(!strcmp(arrayOfTokens[i],"cd")) // special command
		{
			if(chdir(arrayOfTokens[++i])) // changing the directory 
			{
				error();
			}
			while (arrayOfTokens[i] != NULL) // moving i to the next token command
			{
				i++;
			}
			i++;

		}
		else if(!strcmp(arrayOfTokens[i],"path")) // special command
		{
			nOfPathes=0;
			for(int j=1 ;j<indx;j++)
			{
				char *temp = realpath(arrayOfTokens[j],NULL); // check for the path 
				if (temp != NULL)
					paths[j-1] = temp;
				else 
					error();
			nOfPathes++;
			}
			i+=nOfPathes;
		}
		else 
		{
			int pid = fork();
			childsPid[nOfChilds++]=pid ;
			if(pid==-1)
			{       //error
				error();
				exit(FAILURE_END);
			}
			if(pid==0)
			{       //child 
				if(commandHasRedirection(arrayOfTokens, i) != -1)  // check for '>'
				{

				for(int j =0 ;j<nOfPathes;j++)
				{
					char *exe = malloc(sizeof(char)*MAX_PATH); 
					strcpy(exe,paths[j]);
					strcat(exe,"/");
					strcat(exe,arrayOfTokens[i]); // get the full path of the executable 
					if(!access(exe,X_OK))
					{
						execv(exe,arrayOfTokens+i); // execute the program with its arguments utill find NULL 
					}
				}
				error();
				exit(FAILURE_END);
				}
			}
			else 
			{       //parent
				while (arrayOfTokens[i] != NULL) // moving i to the next token command
				{
					i++;
				}
				i++;
				if (i < indx)
					continue;
			}
		}
	}
}

int commandHasRedirection(char *arr[] , int start)
{
	for(int i = start ; arr[i] != NULL ; i++)
	{
		if(!strcmp(arr[i],">") && i != start) // no command before '>'
		{
			arr[i]=NULL;
			if(arr[i+1] == NULL || arr[i+2] != NULL) // no file after '>'
			{
				error();
				return -1 ;
			}
			else 
			{
				int fd = open(arr[i+1],O_WRONLY | O_CREAT,0777); //open or creat with high permissions 
				dup2(fd,STDOUT_FILENO); // changing the output file (redirect the output)
				arr[i+1]=NULL;
				close(fd);
			}
			return i;
		}
	}
	return 0;
}

void error()
{
	char error_message[30] = "An error has occurred\n";
	write(STDERR_FILENO, error_message, strlen(error_message));
}
