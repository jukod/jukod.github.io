# A Makefile for image resources

all: icpc.svg full-icpc.svg ncpc-icpc.svg fig/highest-hill-1.svg fig/highest-hill-2.svg slides.html

slides.html: slides.md Makefile
	pandoc --title "JU Kod" -tslidy -s slides.md -o slides.html

%.svg: %.gv
	dot -Tsvg $< >$@

%.svg: %.dia
	dia -e "$@" -t svg "$<"
