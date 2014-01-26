
test: node_modules
	@node_modules/hydro/bin/hydro test/*.test.js \
		--setup test/hydro.conf.js \
		--formatter hydro-dot

node_modules: package.json
	@packin install -m $< -f $@

.PHONY: test
