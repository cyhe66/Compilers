CC= cc

all: mylexer.l tokens-manual.h
	flex mylexer.l;
	cc lex.yy.c -lfl -o test;
run:
	cat test.txt | ./test
clean:
	rm lex.yy.c 
