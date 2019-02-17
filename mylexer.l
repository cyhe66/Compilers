%{
#include "tokens-manual.h"
	

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
\{			{return '{';}
\|			{return '|';}
\}			{return '}';}
\~			{return '~';}



\`			{return '`';}











%%

int main{
	yylex();
}


