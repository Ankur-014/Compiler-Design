/* author: @Salim Shadman Ankur (1507014) */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507014.tab.h"
	#include<stdlib.h>
	

%}

Datatype "int_i"|"float_f"| "char_c" | "double_d"
identifiers "ankur_"[a-zA-Z]([a-zA-Z0-9])*
arithmatic_operator "jog"|"biyog"|"gun"|"vag"|"pow"
unary_operator "#++"|"#--"|"!#"
logical_operator "&&"|"||"|"!!"
relational_operator "less"|"great"|"lesseq"|"greateq"|"eqeq"|"noteq"
parenthesis "lb"|"rb"|"LP"|"RP"
assignment_operator [=]|"+="|"-="|"/="|"*="
library_func "IN<"|"OUT>"
integer (-|+)?[0-9]+
float [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+
double [+-]?[0-9]+[.][0-9]+{6,12}|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+{6,12}
char [A-Za-z]+
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][a][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][a][/]

/*RE and Action*/

%%


{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

{unary_operator}   {return inc;}
{logical_operator}	{return LOGIC;}
"lb"	 { return LB; }
"rb"	  { return RB; }
"COLON"   { return COLON;}
"Berho"    {   return BREAK;     }
"Choice"      { return CASE;      }
"Vandar"      { return SWITCH;	}
"DEFAULT"     {  return DEFAULT; 	}
"Chalao_Phir" { return WHILE;}
"int_i"	{ return INT; }
"float_f"	{ return FLOAT; }
"double_d"	{return DOUBLE;}
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
"##"	{ return SM; }
"jog"	{ return PLUS;}
"biyog"	{ return MINUS; }
"gun"	{ return MULT; }
"vag"	{ return DIV; }
"pow"	{ return POW; }
"="		{ return ASSIGN;  }
"great"	{ return GT; }
"less"	{ return LT; }

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

