
dependencies: dependencies.json
	@packin install --folder $@ --meta $<
	@ln -snf .. $@/{{project_name}}

test: dependencies
	@$</jest/bin/jest test

.PHONY: test
