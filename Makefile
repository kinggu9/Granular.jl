REPONAME=seaice

.PHONY: doc
doc:
	-mkdir -p ../$(REPONAME)-doc && cd ../$(REPONAME)-doc && pwd && git clone -b gh-pages git@github.com:anders-dc/$(REPONAME) html
	make html -C doc/ && cd ../$(REPONAME)-doc/html && \
		pwd && \
		git add . && \
		git commit -m 'rebuilt docs' && \
		git push origin gh-pages

.PHONY: coverage
coverage:
	@make coverage -C doc/ >/dev/null && \
		cat ../$(REPONAME)-doc/coverage/{python,c}.txt

.PHONY: doctest
doctest:
	@make coverage -C doc/ >/dev/null && \
		cat ../$(REPONAME)-doc/coverage/{python,c}.txt

manual.pdf:
	make latexpdf -C doc/
