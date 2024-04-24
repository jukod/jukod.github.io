# A Makefile for image resources

all: icpc.svg

icpc.svg: icpc.gv

%.svg: %.gv
	dot -Tsvg $< >$@
