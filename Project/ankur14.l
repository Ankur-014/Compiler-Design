%{
	int identifier=0,keyword=0,paren=0,arithmatic=0,unary=0,logical=0,relational=0,assignment=0,library=0,user_func=0,datatype=0,loop=0,cndstatement=0,integer=0,floatt=0,doublet=0,stringt=0,scmnt=0,mcmnt=0;
%}

head "%include"

D_type "int_i"|"float_f"|"string_s"|"char_c"|"double_d"

id "ankur_"[a-zA-Z]([a-zA-Z0-9])*

arith_op "jog"|"biyog"|"gun"|"vag"|"power"

un_op "plus_plus"|"minus_minus"

lg_op "ebong"|"othoba"|"vul"

rel_op "lesser"|"greater"|"lesseq"|"greateq"|"eqeq"|"noteq"|"eq"|"lshift"|"rshift"

assign_op "##"|"+#"|"-#"|"/#"|"*#"

lb_func "CIN>"|"COUT<"

us_func "func"

con_state "When"|"OR"|"Otherwise"

lop "loopie ""< "[0-9]+":"[0-9]+" >"

ent (-|\+)?[0-9]+

flt [+-]?[0-9]+[.][0-9]+|[+-]?[.][0-9]+|[1-9]+e[+-][0-9]+Dat

sl_comment [@].*

ml_comment [ ]*[@][@][a-zA-Z0-9!@$#*(){}_+-,.:\|?><\n\t ]*[@][@]

key "brk"|"cont"|"ret"|"vd"|"mn"

par "lp"|"rp"|"fa"|"fc"


%%
{id} {
	printf("identifier ");
	identifier++;
	}
{key} {
	printf("keyword ");
	keyword++;
}
{par} {
	printf("Parenthesis ");
	paren++;
}
{head} {
	printf("header_file ");
}
{arith_op} {
	printf("arithmatic_operator ");
	arithmatic++;
}
{un_op} {
	printf("unary_operator ");
	unary++;
}
{lg_op} {
	printf("logical_operator ");
	logical++;
}
{rel_op} {
	printf("relational_operator ");
	relational++;
}
{assign_op} {
	printf("assignment_operator ");
	assignment++;
}
{lb_func} {
	printf("library_function : ");
	library++;
}
{us_func} {
	printf("user_function ");
	user_func++;
}
{lop} {
printf("for loop ");
loop++;
}  
{con_state} {
	printf("conditional_statement ");
	cndstatement++;
}
{D_type} {
	printf("Datatype ");
	datatype++;
}
{ent} {
	integer++;
	printf("Integer ");
}
{flt} {
	floatt++;
	printf("Float ");
}
{sl_comment} {
printf("single_line_comment\n");
}
{ml_comment} {
	printf("multiple_line_comment ");
}

"#$#" printf("\n");
\n
{  
}  
%%
int yywrap(){
	return 1;
}
int main()
{
	yyin=freopen("input.txt","r",stdin);
	yyout=freopen("output.txt","w",stdout);
	yylex();
	printf("\nNumber of tokens:");
	printf("\nIdentfiers=%d\narithmatic_operator=%d\nunary_operator=%d\n_logical_operator=%d\nrelational_operator=%d\nassignment_operator=%d\nlibrary_function=%d\ndatatype=%d\nloop=%d\nconditional_statement=%d\ninteger=%d\nfloatnum=%d\ndoublenum=%d\nKeywords=%d\nParenthesis=%d\n ",identifier,arithmatic,unary,logical,relational,assignment,library,datatype,loop,cndstatement,integer,floatt,doublet,keyword,paren);

	fclose(yyin);
	fclose(yyout);
	return 0;
}