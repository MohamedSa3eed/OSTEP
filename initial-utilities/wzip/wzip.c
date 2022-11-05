#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FAILURE_END 1
#define SUCCESSFUL_END 0

int main(int argc , char * argv [])
{
	FILE * f = NULL ;
	char * str = NULL ;
	size_t strlenght = 0; 
	/*char newline = '\n';*/
	if (argc == 1 )
	{
		printf("wzip: file1 [file2 ...]\n");
		exit(FAILURE_END);
	}
	FILE * mainFile = fopen("help.txt","w+");
	for(int i =1 ; i< argc;i++)
	{
		f = fopen(argv[i],"r");
		if (f == NULL)
		{
			printf("wzip: cannot open file\n");
			exit(FAILURE_END);
		}
		while (getline(&str,&strlenght,f) != EOF)
		{
			fprintf(mainFile,"%s",str);
		}
		fclose(f);
	}
	rewind(mainFile);
	size_t counter =1 ;
	char c = (char)fgetc(mainFile);
	while(c != EOF )
	{
		char c2 =c ;
		c = (char) fgetc(mainFile);
		if (c == c2)
		{
			counter ++; 
		}
		else 
		{
			fwrite(&counter,sizeof(int),1,stdout);
			fwrite(&c2,sizeof(char),1,stdout);
			counter =1 ;
		}
	}
	fclose(mainFile);
	remove("help.txt");
	mainFile = NULL ;
	exit(SUCCESSFUL_END) ;
}
