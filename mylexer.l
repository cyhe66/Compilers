%option noyywrap
%{
#include "tokens-manual.h"

enum num_types { 
	_CHAR, //0
	_UCHAR,
	_SHORT,
	_USHORT,
	_INT,
	_UINT,
	_LONG,
	_ULONG,
	_LONGLONG,
	_ULONGLONG,
	_FLOAT,
	_DOUBLE,
	_LDOUBLE//12
};

/* int struct holds type, num_val*/

typedef struct{
	unsigned char type;
	union{
		char c;
		unsigned char uc;
		short s;
		unsigned short us;
		int i;
		unsigned int ui;
		long l;
		unsigned long ul;
		long long ll;
		unsigned long long ull;
		float f;
		double d;
		long double ld;
	} num_val;
} num_group;


/* string struct holds length, string */
typedef struct {
	unsigned int length;
	char * string;
}string_group;

/* converts string to int of correct type, loads into num struct */
int num_funct(char * text, num_group * number, int base, int num_type){
	printf("num_string is: <%s>, base <%d>, type <%d>\n", text, base, num_type);
	number->type = num_type;
	switch(num_type) {
		case _CHAR:
			number->num_val.c = (char) strtol(text, NULL, base);
			break;
		case _UCHAR:
			number->num_val.uc = (unsigned char) strtol(text, NULL, base);
			break;
		case _SHORT:
			number->num_val.s = (short) strtol(text, NULL, base);
			break;
		case _USHORT:
			number->num_val.us = (unsigned short) strtol(text, NULL, base);
			break;
		case _INT:
			number->num_val.i = (int) strtol(text, NULL, base);
			break;
		case _UINT:
			number->num_val.ui = (unsigned int) strtol(text, NULL, base);
			break;
		case _LONG:
			number->num_val.l = strtol(text, NULL, base);
			break;
		case _ULONG:
			number->num_val.ul = (unsigned long) strtol(text, NULL, base);
			break;
		case _LONGLONG:
			number->num_val.ll = (long long) strtol(text, NULL, base);
			break;
		case _ULONGLONG:
			number->num_val.ull = (unsigned long long) strtol(text, NULL, base);
			break;

		case _FLOAT:
			number->num_val.f = strtof(text, NULL);
			break;
		case _DOUBLE:
			number->num_val.d = (double)strtof(text, NULL);
			break;
		case _LDOUBLE:
			number->num_val.ld = (long double)strtof(text, NULL);
			break;
		default: 
			break;
	}
	return 0;
}

typedef union {
	char charlit;
	num_group number;
	string_group string;
	char *ident;
}YYSTYPE;

YYSTYPE yylval;
%}

%%
	/*C Keywords*/
"auto"			{return AUTO;}
"char"			{return CHAR;}
"default"		{return DEFAULT;}
"else"			{return ELSE;}
"for"			{return FOR;}
"inline"		{return INLINE;}
"return"		{return RETURN;}
"static"		{return STATIC;}
"union"			{return UNION;}
"while"			{return WHILE;}
"_Bool"			{return _BOOL;}
"_Complex"		{return _COMPLEX;}
"restrict"		{return RESTRICT;}
"enum"			{return ENUM;}
"goto"			{return GOTO;}
"int"			{return INT;}
"short"			{return SHORT;}
"struct"		{return STRUCT;}
"unsigned"		{return UNSIGNED;}
"break"			{return BREAK;}
"const"			{return CONST;}
"do"			{return DO;}
"extern"		{return EXTERN;}
"if"			{return IF;}
"long"			{return	LONG;}
"signed"		{return SIGNED;}
"switch"		{return SWITCH;}
"void"			{return VOID;}
"case"			{return CASE;}
"continue"		{return CONTINUE;}
"double"		{return DOUBLE;}
"float"			{return FLOAT;}
"_Imaginary"	{return _IMAGINARY;}
"register"		{return REGISTER;}
"sizeof"		{return SIZEOF;}
"typedef"		{return TYPEDEF;}
"volatile"		{return VOLATILE;}

	/*Special Characters */
\+\+			{return PLUSPLUS;}
\-\-			{return MINUSMINUS;}
\<\<			{return SHL;}
\>\>			{return SHR;}
\<\=			{return LTEQ;}
\>\=			{return GTEQ;}
\=\=			{return EQEQ;}
\!\=			{return NOTEQ;}
\&\&			{return LOGAND;}
\|\|			{return LOGOR;}
\.\.\.			{return ELLIPSIS;}
\*\=			{return TIMESEQ;}
\/\=			{return DIVEQ;}
\+\=			{return PLUSEQ;}
\-\=			{return MINUSEQ;}
\<\<\=			{return SHLEQ;}
\>\>\=			{return SHREQ;}
\&\=			{return ANDEQ;}
\|\=			{return OREQ;}
\^\=			{return XOREQ;}


	/*other ascii characters */
\!			{return '!';}
\"			{return '"';}
\#			{return '#';}
\$			{return '$';}
\%			{return '&';}
\&			{return '&';}
\'			{return '\'';}
\(			{return '(';}
\)			{return ')';}
\*			{return '*';}
\+			{return '+';}
\,			{return ',';}
\-			{return '-';}
\.			{return '.';}
\/			{return '/';}
\:			{return ':';}
\;			{return ';';}
\<			{return '<';}
\=			{return '{';}
\>			{return '>';}
\?			{return '?';}
\@			{return '@';}
\[			{return '[';}
\]			{return ']';}
\^			{return '^';}
\_			{return '_';}
\`			{return '`';}
\|			{return '|';}
\{			{return '{';}
\}			{return '}';}
\~			{return '~';}
\			{return '\\';}
	/*number parsing */


	/* floating point constants:
	0.
	3e1
	3.14159
	.0
	1.0E-3
	1e-3
	1.0
	0.00034
	2e+9
	1.0f
	1.0e67L
	0E1L
	*/

		/*integer literals */
	/*decimal-literal integer-suffix(optional)*/
-?[1-9][0-9]*((ul)|(uL)|(Ul)|(UL)|(lu)|(lU)|(Lu)|(LU))	{num_funct(yytext, &yylval.number,10, _ULONG); return NUMBER;}
-?[1-9][0-9]*[uU]			{num_funct(yytext, &yylval.number, 10, _UINT);return NUMBER;}
-?[1-9][0-9]*[lL]			{num_funct(yytext, &yylval.number, 10, _LONG);return NUMBER;}
-?[1-9][0-9]*				{num_funct(yytext, &yylval.number, 10, _INT); return NUMBER;}
	
	/*octal-literal integer-suffix(optional)*/
-?0[0-7]*((ul)|(uL)|(Ul)|(UL)|(lu)|(lU)|(Lu)|(LU))		{num_funct(yytext, &yylval.number, 8, _ULONG); return NUMBER;}
-?0[0-7]*[uU]				{num_funct(yytext, &yylval.number, 8, _UINT);return NUMBER;}
-?0[0-7]*[lL]				{num_funct(yytext, &yylval.number, 8, _LONG);return NUMBER;}
-?0[0-7]*					{num_funct(yytext, &yylval.number, 8, _INT);return NUMBER;}
	/*hex-literal integer-suffix(optional)*/
-?0[xX][0-9a-fA-F]+((ul)|(uL)|(Ul)|(UL)|(lu)|(lU)|(Lu)|(LU))		{num_funct(yytext, &yylval.number, 16, _ULONG);}
-?0[xX][0-9a-fA-F]+[uU]		{num_funct(yytext, &yylval.number, 16, _UINT);return NUMBER;}
-?0[xX][0-9a-fA-F]+[lL]		{num_funct(yytext, &yylval.number, 16, _LONG);return NUMBER;}
-?0[xX][0-9a-fA-F]+			{num_funct(yytext, &yylval.number, 16, _INT);return NUMBER;}

		/*floats literals*/
	/* digit-sequence exponent suffix(optional) */
-?[0-9]+[eE]-?[0-9]+[fF]					{num_funct(yytext, &yylval.number, 10, _FLOAT);return NUMBER;}	
-?[0-9]+[eE]-?[0-9]+[lL]					{num_funct(yytext, &yylval.number, 10, _LDOUBLE);return NUMBER;}	
-?[0-9]+[eE]-?[0-9]+						{num_funct(yytext, &yylval.number, 10, _DOUBLE);return NUMBER;}	
	/*digit-sequence . exponent(optional) suffix(optional) */
-?[0-9]+\.([eE]-?[0-9]+)?[fF]?				{num_funct(yytext, &yylval.number, 10, _FLOAT);return NUMBER;}
-?[0-9]+\.([eE]-?[0-9]+)?[lL]?				{num_funct(yytext, &yylval.number, 10, _LDOUBLE);return NUMBER;}
-?[0-9]+\.([eE]-?[0-9]+)?					{num_funct(yytext, &yylval.number, 10, _DOUBLE);return NUMBER;}
	/*digit-sequence(optional) . digit-sequence exponent(optional) suffix(optional) */
-?([0-9]+)?\.[0-9]+([eE]-?[0-9]+)?[fF]		{num_funct(yytext, &yylval.number, 10, _FLOAT);return NUMBER;}
-?([0-9]+)?\.[0-9]+([eE]-?[0-9]+)?[lL]		{num_funct(yytext, &yylval.number, 10, _LDOUBLE);return NUMBER;}
-?([0-9]+)?\.[0-9]+([eE]-?[0-9]+)?			{num_funct(yytext, &yylval.number, 10, _DOUBLE);return NUMBER;}

		/*character literals*/
	/*c-char or L-char*/
	/*	\0 \a \b \f \n \r \t \v ' " \ \\ \? hex escapes, octal escapes
	else:	 \\%03o
	*/
L?\'\\0.*\'									{yylval.charlit = '\0'; printf("\\0\n"); return CHARLIT;}
L?\'\\a.*\'									{yylval.charlit = '\a'; printf("\\a\n"); return CHARLIT;}
L?\'\\b.*\'									{yylval.charlit = '\b'; printf("\\b\n"); return CHARLIT;}
L?\'\\f.*\'									{yylval.charlit = '\f'; printf("\\f\n"); return CHARLIT;}
L?\'\\n.*\'									{yylval.charlit = '\n'; printf("\\n\n"); return CHARLIT;}
L?\'\\r.*\'									{yylval.charlit = '\r'; printf("\\r\n"); return CHARLIT;}
L?\'\\t.*\'									{yylval.charlit = '\t'; printf("\\t\n"); return CHARLIT;}
L?\'\\v.*\'									{yylval.charlit = '\v'; printf("\\v\n"); return CHARLIT;}
L?\'\\\'.*\'								{yylval.charlit = '\''; printf("\\\'\n");return CHARLIT;}
L?\'\\\".*\'								{yylval.charlit = '\"'; printf("\\\"\n");return CHARLIT;}
L?\'\\\\\'.*\'								{yylval.charlit = '\\'; printf("\\\\\n");return CHARLIT;}
L?\'\\\?.*\'									{yylval.charlit = '\?'; printf("\\\?\n");return CHARLIT;}

\'[^\'\\\n]+\'								{printf("<%s>", yytext); return CHARLIT;}
.			{ECHO;}

%%
#include <stdio.h>

int main(){
	printf("starting program\n");
	int ret_val;
	float val;
	while ((ret_val = yylex()) != TOKEOF) {
		/*printf("<%d>\n", ret_val);*/
	}
	return 0;

}

