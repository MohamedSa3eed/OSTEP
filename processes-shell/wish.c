#include <stdio.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

#define SUCCESSFUL_END 0
#define FAILURE_END    1

char *paths[100]={"/bin/","/usr/bin/"};
int nOfPathes =2;
char * arrayOfTokens[100];
int indx =0 ;

void getTokens();
void execCommand();
void error();

int main (int argc, char *argv[])
{
	if(argc == 1) //interactive mode 
	{
		getTokens();

	}
	else if (argc == 2) //batch mode
	{

	}
	else
	{
	       error();	
	       exit(FAILURE_END);
	}
	return 0;
}

void getTokens()
{
	while(1)
	{
		printf("wish> ");
		indx =0 ;
		char *original;
		size_t len = 0 ;
		getline(&original,&len,stdin);
		char *token;
		while( (token = strsep(&original," \n")) != NULL ) //remove white spaces and newlines
		{	
			if(memcmp(token,"\0",1)) //not equal 
			{
				arrayOfTokens[indx] = token;
				indx++;
			}
		}
		arrayOfTokens[indx++]="\n";
		/*for(int i =0 ;i <indx ;i++)*/
		/*{*/
			/*printf("%s\n",arrayOfTokens[i]);*/
		/*}*/
		execCommand();
	}
}

void execCommand()
{
	for(int i =0 ; i<indx ;i++)
	{
		if (!strcmp(arrayOfTokens[i], "exit"))
		{
			exit(SUCCESSFUL_END);
		}
		else if(!strcmp(arrayOfTokens[i],"cd"))
		{
			if(chdir(arrayOfTokens[++i]))
			{
				error();
			}
		}
		else if(!strcmp(arrayOfTokens[i],"path"))
		{
			nOfPathes=0;
			for(int j=1 ;j<indx-1;j++)
			{
				char *temp = realpath(arrayOfTokens[j],NULL);
				if (temp != NULL)
					paths[j-1] = temp;
				else 
					error();
			nOfPathes++;
			}
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

			}
			else 
			{       //parent
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
