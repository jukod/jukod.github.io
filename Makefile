# A Makefile for image resources

all: icpc.svg icpc-full.svg

icpc.svg: icpc.gv

icpc-full.svg: icpc-full.gv

%.svg: %.gv
	dot -Tsvg $< >$@
