
serve: node_modules
	@node_modules/serve/bin/serve -Slojp 0

test: node_modules
	@sed "s/'{{project_name}}'/'.\/'/" Readme.md | node_modules/jsmd/bin/jsmd
	@node_modules/hydro/bin/hydro test/*.test.js \
		--setup test/hydro.conf.js \
		--formatter hydro-dot

node_modules: *.json
	@packin install \
		--meta deps.json,package.json \
		--folder $@

.PHONY: serve test
