CC= cc

all: mylexer.l tokens-manual.h
	flex mylexer.l;
	cc lex.yy.c -o test;
	./test;

lex.yy.c: test.txt

mylexer.c: lex.yy.l
