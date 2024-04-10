O = out
.PHONY: all
#PREFIX = $(shell echo $$PREFIX)
PREFIX = /data/data/com.termux/files/usr

all:
	@echo "Available commands:"
	@echo "make pack-deb : Build deb package"
	@echo "make clear : Clear generated files"

pack-deb:
	@mkdir -v $(O)
	@mkdir -v $(O)/deb
	@mkdir -pv $(O)/deb$(PREFIX)
	@mkdir -pv $(O)/deb$(PREFIX)/bin/
	@cp -rv src/sudo $(O)/deb$(PREFIX)/bin/
	@cp -rv dpkg-conf $(O)/deb/DEBIAN
	@printf "\033[1;38;2;254;228;208m[+] Build packages.\033[0m\n"&&sleep 1s
	@chmod -Rv 755 $(O)/deb/DEBIAN
	@chmod -Rv 755 $(O)/deb$(PREFIX)/bin
	@chmod -Rv 777 $(O)/deb$(PREFIX)/bin/sudo
	@cd $(O)/deb&&dpkg -b . ../../simple-sudo.deb
	@printf "\033[1;38;2;254;228;208m    .^.   .^.\n"
	@printf "    /⋀\\_ﾉ_/⋀\\ \n"
	@printf "   /ﾉｿﾉ\\ﾉｿ丶)|\n"
	@printf "  |ﾙﾘﾘ >   )ﾘ\n"
	@printf "  ﾉノ㇏ Ｖ ﾉ|ﾉ\n"
	@printf "        ⠁⠁\n"
	@printf "\033[1;38;2;254;228;208m[*] Build done, package: simple-sudo.deb\033[0m\n"

clear:
	rm -rf ./$(O)
