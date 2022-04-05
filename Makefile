hooks:
	@chmod +x .hooks/pre-commit
	@git config core.hooksPath .hooks

clean:
	latexmk -outdir=target -C thesis.tex

compile:
	latexmk -outdir=target -output-format=pdf -pdf thesis.tex

record-pkg:
	latex -output-directory=target  -record-package-usages=packages.txt thesis.tex

freeze: record-pkg clean

install-pkg:
	mpm --update-some=packages.txt

pre-commit: record-pkg freeze