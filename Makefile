
PREFIX ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man/man1

install: fsplates.1 uninstall
	@echo "installing default templates to '~/.fsplates'"
	@if ! [[ -e "${HOME}/.fsplates" ]]; then \
		cp -r "${PWD}/templates" "${HOME}/.fsplates"; \
	else \
		echo "templates already installed"; \
	fi
	@cp -f fsplates.sh $(PREFIX)/bin/fsplates
	@install fsplates.1 $(MANPREFIX)

uninstall:
	@rm -f $(PREFIX)/bin/fsplates
	@rm -f $(MANPREFIX)/fsplates.1

fsplates.1: fsplates.1.md
	@curl -# -F page=@fsplates.1.md -o $@ http://mantastic.herokuapp.com

.PHONY: install uninstall
