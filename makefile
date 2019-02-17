CC= cc

all: mylexer.c tokens-manual.h
	flex mylexer.c;
	cc lex.yy.c -o test;
	./test;

lex.yy.c: test.txt

mylexer.c: lex.yy.c
