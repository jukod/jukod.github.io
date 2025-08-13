# A Makefile for image resources

all: \
	icpc.svg \
	full-icpc.svg \
	ncpc-icpc.svg \
	fig/highest-hill-1.svg \
	fig/highest-hill-2.svg \
	ncpc2025/opening.html \
	slides.html

slides.html: slides.md Makefile
	pandoc --title "JU Kod" -tslidy -s $< -o $@

ncpc2025/opening.html: ncpc2025/opening.md Makefile
	pandoc --title "NCPC 2025 @ JU" -tslidy -s $< -o $@

%.svg: %.gv
	dot -Tsvg $< >$@

%.svg: %.dia
	dia -e "$@" -t svg "$<"
