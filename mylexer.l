%{
#include "tokens-manual.h"
#undef yywrap

enum num_types{
	_CHAR; //0
	_UCHAR;
	_SHORT;
	_USHORT;
	_INT;
	_UINT;
	_LONG;
	_ULONG;
	_LONGLONG;
	_ULONGLONG;
	_FLOAT;
	_DOUBLE;
	_LDOUBLE;//12
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
		unsigned long long ul;
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
int num_funct(char * text, num_group * number, unsigned char ntype, int base;){
	switch(type) {
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
		case _LONG;
			number->num_val.l = strtol(text, NULL, base);
			break;
		case _ULONG;
			number->num_val.ul = (unsigned long) strtol(text, NULL, base);
			break;
		case _FLOAT:
			number-num_val.f = strtof(text, NULL, base);
			break;
		case:_DOUBLE:
			number->num_val.d = (double)strtof(text, NULL, base);
			break;
		case:_LDOUBLE:
			number->num_val.ld = (long double)strtof(text, NULL, base);
			break;
		default: 
			break;
	}
	number-> type = ntype;
	return 0;
}

typedef union {
	char charlit;
	number_group number;
	string_group string;
	char *ident;
}YYSTYPE;

extern YYSTYPE yylval;


%}

%%
	/*C Keywords*/
"auto"			{return AUTO};
"char"			{return CHAR};
"default"		{return DEFAULT};
"else"			{return ELSE};
"for"			{return FOR};
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
\.\.\.			{return ELLIPSES;}
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
\}			{return ')';}
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
\\			{return '\';}
\]			{return ']';}
\^			{return '^';}
\_			{return '_';}
\`			{return '`';}
\{			{return '{';}
\|			{return '|';}
\}			{return '}';}
\~			{return '~';}



	/*number parsing */

%%
#include <stdio.h>

int main(int argc, char **argv){
	printf(stderr,"%d, %s", argc, argv);
	//file = fopen();
	//yylex();
}


