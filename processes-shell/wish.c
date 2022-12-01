#include <stdio.h>
#include <string.h>
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
		if(!strcmp(arrayOfTokens[i],"cd"))
		{
			if(chdir(arrayOfTokens[++i]))
			{
				error();
			}
		}
		if(!strcmp(arrayOfTokens[i],"path"))
		{
			nOfPathes=0;
			for(int j=1 ;j<indx-1;j++)
			{
				char *temp = realpath(arrayOfTokens[j],NULL);
				paths[j-1] = temp;
				/*if(*(arrayOfTokens[j]) == '/')*/
				/*{*/
					/*paths[j-1] = arrayOfTokens[j];*/
					/*printf("%d\n",j);*/
				/*}*/
				/*else*/
				/*{*/
					/*char* temp=(char*)malloc(sizeof(char)*500) ;*/
					/*getcwd(temp,500);*/
					/*strcat(temp,"/");*/
					/*strcat(temp,arrayOfTokens[j]);*/
					/*strcat(temp,"/");*/
					/*[>printf("%s\n",temp);<]*/
					/*printf("%d\n",j);*/
					/*[>paths[j-1]="/bin";<]*/
					/*paths[j-1] = temp ;*/
					/*[>strcpy(paths[j-1] , temp) ;<]*/
				/*}*/
				nOfPathes++;
			}
			for(int j =0 ;j <nOfPathes ;j++)
			{
				/*printf("here\n");*/
				printf("%s\n",paths[j]);
			}
		}
	}
}

void error()
{
	char error_message[30] = "An error has occurred\n";
	write(STDERR_FILENO, error_message, strlen(error_message));
}
