/* author: ankur1507014 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507014.tab.h"
	#include<stdlib.h>
	

%}

Datatype "int"|"float"
identifiers "ankur_"[a-zA-Z]([a-zA-Z0-9])*
arithmatic_operator "jog"|"biyog"|"goon"|"bag"|"pow"
unary_operator "~++"|"~--"|"~~"|"~!"|"~+"|"~-"
logical_operator [&][&]|[|][|]|[!][!]
relational_operator "<<"|">>"|"<<="|">>="|"=="|"!="
assignment_operator [=]|"+="|"-="|"/="
import "import "[a-zA-Z]([a-zA-Z0-9])*
library_function "TAKEIN<"|"SHOWOUT>"
user_function "function"
conditional_statement "IF"|"ELSE"|"ELIF"|"WHILE"
integer (-|\+)?[0-9]+
float [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][m][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][m][/]

/*RE and Action*/

%%
"inout"   {return inpit;}
"import"  {return importtt;}

{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

"~++"    {return inc;}
"{"	 { return LB; }
"}"	  { return RB; }
"COLON"   { return COLON;}
"BREAK"    {   return BREAK;     }
"CASE"      { return CASE;      }
"select"      { return SWITCH;	}
"DEFAULT"     {  return DEFAULT; 	}
"WHILE" { return WHILE;}
"int"	{ return INT; }
"float"	{ return FLOAT; }
"char"	{ return CHAR; }
":"     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"FOR"   { return FOR;}	
"LP"	{ return LP; }
"RP"	{ return RP; }

"cm"	{ return CM; }
"$$"	{ return SM; }
"jog"	{ return PLUS;}
"biyog"	{ return MINUS; }
"goon"	{ return MULT; }
"bag"	{ return DIV; }
"="	{ return ASSIGN;  }
">>"	{ return GT; }
"<<"	{ return LT; }

[a-z]+  {
	 yylval.string=strdup(yytext);return VAR;
	}

"IF"		{ return IF;}
"ELSE"		{ return ELSE;}

"function @func_name"	{ return VOIDMAIN; }

[ \t\n]*	

.	{
		yyerror("Unknown Character.\n");
	}
%%

/* user subroutines */

int main()
{
	yyin = freopen("a.txt","r",stdin);
	yyout = freopen("out.txt","w",stdout);
	yyparse();
	
}

