all: build

install: components
	npm install

components:
	component install -vd

build:
	component build -vd

clean:
	@rm -rf components

.PHONY: all clean
