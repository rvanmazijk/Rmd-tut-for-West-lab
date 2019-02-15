all: webpage slides pretut

webpage: index.html

slides: index.pdf

pretut: pre-tut-setup.html

index.html: index.Rmd _output.yml
	Rscript -e '\
	library(rmarkdown);\
	render("$<", "html_document")'

index.pdf: index.Rmd _output.yml
	Rscript -e '\
	library(rmarkdown);\
	render("$<", "beamer_presentation")'

pre-tut-setup.html: pre-tut-setup.Rmd
	Rscript -e '\
	library(rmarkdown);\
	render("$<", "html_document")'
