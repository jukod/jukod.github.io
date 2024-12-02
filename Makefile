# A Makefile for image resources

all: icpc.svg icpc-full.svg ncpc-icpc.svg slides.html

slides.html: slides.md Makefile
	pandoc --title "JU Kod" -tslidy -s slides.md -o slides.html

%.svg: %.gv
	dot -Tsvg $< >$@
