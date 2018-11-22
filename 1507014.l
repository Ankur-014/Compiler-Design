/* author: ankur1507014 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507014.tab.h"
	#include<stdlib.h>
	

%}

Datatype "int"|"float"| "char"
identifiers "ankur_"[a-zA-Z]([a-zA-Z0-9])*
arithmatic_operator "jog"|"biyog"|"gun"|"vag"|"pow"
unary_operator "#++"|"#--"|"##"|"#!"|"#+"|"#-"
logical_operator [&][&]|[|][|]|[!][!]
relational_operator "<<"|">>"|"<<="|">>="|"=="|"!="
assignment_operator [=]|"+="|"-="|"/="
library_func "IN<"|"OUT>"
user_function "function"
conditional_statement "IF"|"ELSE"|"ELIF"|"WHILE"
integer (-|\+)?[0-9]+
float [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][m][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][m][/]

/*RE and Action*/

%%


{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

{unary_operator}   {return inc;}
"{"	 { return LB; }
"}"	  { return RB; }
"COLON"   { return COLON;}
"Berho"    {   return BREAK;     }
"Choice"      { return CASE;      }
"Vandar"      { return SWITCH;	}
"DEFAULT"     {  return DEFAULT; 	}
"Chalao_Phir" { return WHILE;}
"int_i"	{ return INT; }
"float_f"	{ return FLOAT; }
"char_c"	{ return CHAR; }
":"     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"Ononto"   { return FOR;}	
"LP"	{ return LP; }
"RP"	{ return RP; }
"cm"	{ return CM; }
"$$"	{ return SM; }
"jog"	{ return PLUS;}
"biyog"	{ return MINUS; }
"gun"	{ return MULT; }
"vag"	{ return DIV; }
"pow"	{ return POW; }
"="		{ return ASSIGN;  }
">>"	{ return GT; }
"<<"	{ return LT; }

{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"Agar"		{ return IF;}
"Nehito"		{ return ELSE;}

"function "[A-Za-z]+	{ return FUNCTION; }

[ \t\n]*	

.	{
		yyerror("Unknown Character.\n");
	}
%%

/* user subroutines */

int main()
{
	yyin = freopen("in.txt","r",stdin);
	yyout = freopen("out.txt","w",stdout);
	yyparse();
	
}

