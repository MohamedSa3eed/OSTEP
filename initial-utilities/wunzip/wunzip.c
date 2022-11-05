#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FAILURE_END 1
#define SUCCESSFUL_END 0

int main (int argc , char * argv[])
{
	FILE *f = NULL;
	int counter ; 
	char ascii ;
        if (argc == 1 )
	{
		printf("wunzip: file1 [file2 ...]\n");
		exit(FAILURE_END);
	}
	for(int i = 1 ;i < argc ; i++)
	{
		f = fopen(argv[i],"r");
		while(fread(&counter,sizeof(int),1,f) != 0) 
		{
			/*printf("here\n");*/
			/*fread(&counter,sizeof(int),1,f);*/
			fread(&ascii,sizeof(char),1,f);
			for(int j = 0 ; j <counter;j++)
			{
				printf("%c",ascii);
			}
		}
		fclose(f);
	}
	exit(SUCCESSFUL_END);
}
