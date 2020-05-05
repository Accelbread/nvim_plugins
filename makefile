.PHONY: init update build helptags

init:
	git submodule update --init
	make helptags
	make build

update:
	git submodule update --remote --merge
	make helptags
	make build

build:
	make -C start/90languageclient-neovim release

helptags:
	git submodule foreach '[ -d doc ] && nvim --headless -c "helptags doc/|q"; \
	true'
