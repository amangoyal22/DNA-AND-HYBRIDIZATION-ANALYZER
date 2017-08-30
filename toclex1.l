%option noyywrap
%{
	#include<stdio.h>
	int j;
%}

%%
[a|A]			{
				printf("Protein Adenine\n");
				j=0;
				if (toupper(input[j+1])=='T' && ((input[j+2]==',') || (input[j+2]==NULL)))
				{
					printf("%c --> ",input[j+1]);
					printf("Protein Thyamine\n");
					printf("Correct pair\n");
					if (input[j+2]==',')
					{
						printf("%c --> ",input[j+2]);
						printf("One set over. Waiting for the other set\n");
						if (input[j+3]==NULL)
						{
							printf("Not the correct way to end the string. Does not belong to the language");
							exit(-1);
						}
					}
				}
				else
				{
					if (toupper(input[j+1])==NULL)
					{
						printf("Protein cannot exist without its other complementary part. ");
					}
					else
					{
						printf("Wrong combination as A can make pair with T only.\n");
					}
					printf("Does not belong to the language.\n");
					exit(-1);
				}
				j=j+2;
			}
[t|T]			{
				printf("Protein Thyamine\n");
				j=0;
				if (toupper(input[j+1])=='A' && ((input[j+2]==',') || (input[j+2]==NULL)))
				{
					printf("%c --> ",input[j+1]);
					printf("Protein Adenine\n");
					printf("Correct pair\n");
					if (input[j+2]==',')
					{
						printf("%c --> ",input[j+2]);
						printf("One set over. Waiting for the other set\n");
						if (input[j+3]==NULL)
						{
							printf("Not the correct way to end the string. Does not belong to the language");
							exit(-1);
						}
					}
				}
				else
				{
					if (toupper(input[j+1])==NULL)
					{
						printf("Protein cannot exist without its other complementary part. ");
					}
					else
					{
						printf("Wrong combination as A can make pair with T only.\n");
					}
					printf("Does not belong to the language.\n");
					exit(-1);
				}
				j=j+2;
			}
[g|G]			{
				printf("Protein Guanine\n");
				j=0;
				if (toupper(input[j+1])=='C' && ((input[j+2]==',') || (input[j+2]==NULL)))
				{
					printf("%c --> ",input[j+1]);
					printf("Protein Cytosine\n");
					printf("Correct pair\n");
					if (input[j+2]==',')
					{
						printf("%c --> ",input[j+2]);
						printf("One set over. Waiting for the other set\n");
						if (input[j+3]==NULL)
						{
							printf("Not the correct way to end the string. Does not belong to the language");
							exit(-1);
						}
					}
				}
				else
				{
					if (toupper(input[j+1])==NULL)
					{
						printf("Protein cannot exist without its other complementary part. ");
					}
					else
					{
						printf("Wrong combination as A can make pair with T only.\n");
					}
					printf("Does not belong to the language.\n");
					exit(-1);
				}
				j=j+2;
			}
[c|C]			{
				printf("Protein Cytosine\n");
				j=0;
				if (toupper(input[j+1])=='G' && ((input[j+2]==',') || (input[j+2]==NULL)))
				{
					printf("%c --> ",input[j+1]);
					printf("Protein Guanine\n");
					printf("Correct pair\n");
					if (input[j+2]==',')
					{
						printf("%c => ",input[j+2]);
						printf("One set over. Waiting for the other set\n");
						if (input[j+3]==NULL)
						{
							printf("Not the correct way to end the string. Does not belong to the language");
							exit(-1);
						}
					}
				}
				else
				{
					if (toupper(input[j+1])==NULL)
					{
						printf("Protein cannot exist without its other complementary part. ");
					}
					else
					{
						printf("Wrong combination as A can make pair with T only.\n");
					}
					printf("Does not belong to the language.\n");
					exit(-1);
				}
				j=j+2;
			}
[,]			;
.			{
				printf("Unknown Character");
				exit(0);
			}
%%

int main()
{
	yylex();
	yyin=fopen("TOC_text.txt","r");
	return 0;
}