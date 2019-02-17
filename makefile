CC= cc

all: mylexer.l tokens-manual.h
	flex mylexer.l;
	cc lex.yy.c -lfl -o test;
	./test;

mylexer.l: lex.yy.l
