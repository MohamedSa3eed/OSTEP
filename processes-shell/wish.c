#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

#define SUCCESSFUL_END 0
#define FAILURE_END    1
#define MAX_PATH       4096

char *paths[100]={"/bin/","/usr/bin/"};
int nOfPathes =2;
char * arrayOfTokens[100];
int indx =0 ;

void getTokens(FILE *);
void execCommand();
/*void itHasredirection(char *str);*/
void error();

int main (int argc, char *argv[])
{
	if(argc == 1) //interactive mode 
	{
		getTokens(stdin);

	}
	else if (argc == 2) //batch mode
	{
		FILE *input = fopen(argv[1],"r");
		if(input != NULL)
		{
			getTokens(input);
		}
		else
		{
			error();
			exit(FAILURE_END);
		}
	}
	else
	{
	       error();	
	       exit(FAILURE_END);
	}
	return 0;
}

void getTokens(FILE* input)
{
	while(1)
	{
		if(input == stdin)
			printf("wish> ");
		int temp = indx;
		indx =0 ;
		char *original;
		size_t len = 0 ;
		if(getline(&original,&len,input)==EOF)
			exit(SUCCESSFUL_END);
		char *token;
		while( (token = strsep(&original," \n")) != NULL ) //remove white spaces and newlines
		{	
			if(memcmp(token,"\0",1)) //not equal 
			{
				arrayOfTokens[indx] = token;
				indx++;
			}
		}
		/*arrayOfTokens[indx++]="\0";*/
		/*for(int i =0 ;i <indx ;i++)*/
		/*{*/
			/*printf("%s\n",arrayOfTokens[i]);*/
		/*}*/
		for(int i = indx ; i < temp ; i++)
		{
			arrayOfTokens[i]=NULL;
		}
		execCommand();
	}
}

void execCommand()
{
	for(int i =0 ; i<indx ;i++)
	{
		if (!strcmp(arrayOfTokens[i], "exit"))
		{
			/*printf("here\n");*/
			if(arrayOfTokens[i+1] == NULL)
			{	
				exit(SUCCESSFUL_END);
			}
			else
			{
				i++;
				error();
			}
		}
		else if(!strcmp(arrayOfTokens[i],"cd"))
		{
			if(chdir(arrayOfTokens[++i]))
			{
				error();
			}
			while (arrayOfTokens[i] != NULL)
			{
				i++;
			}
			i++;

		}
		else if(!strcmp(arrayOfTokens[i],"path"))
		{
			nOfPathes=0;
			for(int j=1 ;j<indx;j++)
			{
				char *temp = realpath(arrayOfTokens[j],NULL);
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
			if(pid==-1)
			{       //error
				error();
				exit(FAILURE_END);
			}
			if(pid==0)
			{       //child 
				for(int j =0 ;j<nOfPathes;j++)
				{
					char *exe = malloc(sizeof(char)*MAX_PATH);
					strcpy(exe,paths[j]);
					strcat(exe,"/");
					strcat(exe,arrayOfTokens[i]);
					if(!access(exe,X_OK))
					{
						execv(exe,arrayOfTokens+i);
					}
				}
				error();
				exit(FAILURE_END);
			}
			else 
			{       //parent
				while (arrayOfTokens[i] != NULL)
				{
					i++;
				}
				i++;
				wait(NULL);
			}
		}
	}
}

void error()
{
	char error_message[30] = "An error has occurred\n";
	write(STDERR_FILENO, error_message, strlen(error_message));
}
