NAME=synthetic-asset-contract

DIAGRAM_NAMES=

IMAGES=$(addprefix images/, $(addsuffix .png, ${DIAGRAM_NAMES}))

all: html

images:
	mkdir -p images

images/%.png: diagrams/$(basename $(notdir %)).dia
	dia -e $@ -t png $<

html: ${NAME}.html
pdf: ${NAME}.pdf

${IMAGES}: images

${NAME}.html: ${NAME}.rst ${IMAGES}
	rst2html5.py --footnote-references=superscript --math-output="MathJax ${MATHJAX_URL}" $< > $@

${NAME}.pdf: ${NAME}.rst covenant-code.rst ${IMAGES}
	pandoc --toc --toc-depth 4 -V documentclass:report -V geometry:left=20mm -V geometry:right=20mm -V papersize:a4 -f rst -t latex $< -o $@

latex:
	@docker run --rm --volume $$(pwd):/data --user $$(id -u):$$(id -g) pandoc/latex synthetic-asset-contract.rst --metadata-file=metadata.yml -o synthetic-asset-contract.pdf

clean:
	$(RM) ${NAME}.html ${NAME}.pdf
	$(RM) -rf images

.PHONY: clean all html pdf
