REPORTER=dot

serve: node_modules/.bin
	@node_modules/.bin/serve

test:
	@node_modules/.bin/mocha test/*.test.js \
		--reporter $(REPORTER) \
		--bail

node_modules: deps.json
	@packin install

node_modules/.bin: package.json node_modules
	@npm install mocha serve

clean:
	rm -r node_modules

.PHONY: clean serve test