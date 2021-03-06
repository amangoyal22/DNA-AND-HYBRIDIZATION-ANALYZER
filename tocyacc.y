%{
	#include<stdio.h>
	#include<stdlib.h>
	extern int yylex();
	void yyerror(char *msg);
%}

%union{
	char c;
}

%type <c> P S Q R O X Y

%%

S:
	X '$'			{printf("String terminates\n");}
	|X ',' Y '$'			{printf("Valid\n");}
	;

X:
	P			{printf("String terminates\n");}
	| Q			{printf("String terminates\n");}
	| R			{printf("String terminates\n");}
	| O			{printf("String terminates\n");}
	;

Y:
	X ',' Y			{printf("Valid\n");}
	| X			{printf("String terminates\n");}
	;

P:
	'a' 't'			{printf("Valid\n");}
	| 'A' 't'		{printf("Valid\n");}
	| 'A' 'T'		{printf("Valid\n");}
	| 'a' 'T'		{printf("Valid\n");}
	;

Q:
	't' 'a'			{printf("Valid\n");}
	| 'T' 'a'		{printf("Valid\n");}
	| 'T' 'A'		{printf("Valid\n");}
	| 't' 'A'		{printf("Valid\n");}
	;

R:
	'c' 'g'			{printf("Valid\n");}
	| 'C' 'g'		{printf("Valid\n");}
	| 'C' 'G'		{printf("Valid\n");}
	| 'c' 'G'		{printf("Valid\n");}
	;

O:
	'g' 'c'			{printf("Valid\n");}
	| 'G' 'c'		{printf("Valid\n");}
	| 'G' 'C'		{printf("Valid\n");}
	| 'g' 'C'		{printf("Valid\n");}
	;

%%

void yyerror(char *msg)
{
	fprintf(stderr,"%s",msg);
	getch();
	exit(1);
}


int main()
{
		/*
	char line[100],a[100],b[100];
	FILE *input=fopen("text1.txt","r");
	while ( fgets ( line, 100, input ) != NULL )
      {
         if(i==0)
         {
         	strcpy(a,line);
         	i++;
         }
         else
         {
         	strcpy(b,line);
         }
      }
	  */

	yyparse();
	return 0;
}