REPO_FILES		:= $(wildcard .??*)
REPO_CONFIG_DIRS	:= $(wildcard .config/*)
IGNORE_FILES		:= .DS_Store .git .gitmodules .gitignore .config
IGNORE_DIRS		:= .claude
DOT_FILES		:= $(filter-out $(IGNORE_FILES),$(REPO_FILES))
CONFIG_DIRS		:= $(filter-out $(IGNORE_DIRS),$(REPO_CONFIG_DIRS))

all: install

check:
	@$(foreach dotfile, $(DOT_FILES), /bin/ls -dF $(dotfile);)
	@$(foreach configdir, $(CONFIG_DIRS), echo $(configdir);)

install:
	mkdir -p ${HOME}/.config
	@$(foreach dotfile, $(DOT_FILES), ln -sfnv $(abspath $(dotfile)) "$(HOME)/$(dotfile)";)
	@$(foreach configdir, $(CONFIG_DIRS), ln -sfnv $(abspath $(configdir)) "$(HOME)/$(configdir)";)
	touch ${HOME}/.w3m/history

.PHONY: emacs
emacs:
	emacs --batch -f batch-byte-compile ~/.emacs.d/init.el

.PHONY: skk
skk:
	curl -o ${HOME}/.eskk/SKK-JISYO.L --create-dirs http://openlab.jp/skk/skk/dic/SKK-JISYO.L
	touch ${HOME}/.eskk/USER.L

clean:
	@-$(foreach dotfile, $(DOT_FILES), rm -vrf $(HOME)/$(dotfile);)
	@-$(foreach configdir, $(REPO_CONFIG_DIRS), rm -vrf $(HOME)/$(configdir);)
