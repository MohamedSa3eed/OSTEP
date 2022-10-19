#include <stdio.h>
#include "stdlib.h"
#include <string.h>

#define SUCCESS_END 0
#define FAIL_END    1

int main ( int argc , char * argv[])
{
	FILE *f = NULL;
	char *str = NULL;
        size_t STR_LENGTH= 100;
	if (argc == 1)
	{
		printf("wgrep: searchterm [file ...]\n");
		exit(FAIL_END) ;
	}
	if (argc == 2)
	{
		while (getline(&str,&STR_LENGTH,stdin) != EOF)
		{
			if (strstr(str,argv[1]) != NULL)
			printf("%s",str);
		}
	}
	for(int i =1 ; i< argc ; i++)
	{
		f = fopen(argv[i],"r");
		if(f == NULL)
		{
			if(i==1)
			{
				continue;
			}
			printf("wgrep: cannot open file\n");
	                free(str);
			exit(FAIL_END);
		}
		while (getline(&str,&STR_LENGTH,f) != -1)
		{
			if (strstr(str,argv[1]) != NULL)
			printf("%s",str);
		}
		fclose(f);
	}
	free(str);
	exit(SUCCESS_END);

}
