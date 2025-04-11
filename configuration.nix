{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.launchers = ''
		# files existing
		mkdir -p ${home}/.local
		chown ${username}:${group} ${home}/.local
		chmod 700 ${home}/.local
		
		# files existing
		mkdir -p ${home}/.local/share
		chown ${username}:${group} ${home}/.local/share
		chmod 700 ${home}/.local/share

		# files existing
		mkdir -p ${home}/.local/share/applications
		chown ${username}:${group} ${home}/.local/share/applications
		chmod 700 ${home}/.local/share/applications

		cp ${pkgs.neovim}/share/applications/nvim.desktop ${home}/.local/share/applications/nvim.desktop
		chown ${username}:${group} ${home}/.local/share/applications/nvim.desktop
		chmod 700 ${home}/.local/share/applications/nvim.desktop

		${pkgs.xdg-utils}/bin/xdg-mime default nvim.desktop text/plain
		xdg-mime default nvim.desktop text/x-log
		xdg-mime default nvim.desktop text/x-readme
		xdg-mime default nvim.desktop text/x-markdown
		xdg-mime default nvim.desktop text/x-python
		xdg-mime default nvim.desktop text/x-shellscript
		xdg-mime default nvim.desktop text/x-sh
		xdg-mime default nvim.desktop text/x-csrc
		xdg-mime default nvim.desktop text/x-c++src
		xdg-mime default nvim.desktop text/x-chdr
		xdg-mime default nvim.desktop text/x-c++hdr
		xdg-mime default nvim.desktop text/x-java
		xdg-mime default nvim.desktop text/x-go
		xdg-mime default nvim.desktop text/x-rustsrc
		xdg-mime default nvim.desktop text/x-lua
		xdg-mime default nvim.desktop text/x-perl
		xdg-mime default nvim.desktop text/x-php
		xdg-mime default nvim.desktop text/x-ruby
		xdg-mime default nvim.desktop text/x-sql
		xdg-mime default nvim.desktop text/x-tex
		xdg-mime default nvim.desktop text/x-tcl
		xdg-mime default nvim.desktop text/x-cmake
		xdg-mime default nvim.desktop text/x-meson
		xdg-mime default nvim.desktop text/x-yaml
		xdg-mime default nvim.desktop text/x-json
		xdg-mime default nvim.desktop text/x-xml
		xdg-mime default nvim.desktop text/x-ini
		xdg-mime default nvim.desktop text/x-properties
		xdg-mime default nvim.desktop text/x-config
		xdg-mime default nvim.desktop text/x-toml
		xdg-mime default nvim.desktop text/x-nix
		xdg-mime default nvim.desktop text/x-makefile
		xdg-mime default nvim.desktop text/x-diff
		xdg-mime default nvim.desktop text/x-patch
		xdg-mime default nvim.desktop text/x-kotlin
		xdg-mime default nvim.desktop text/x-scala
		xdg-mime default nvim.desktop text/x-swift
		xdg-mime default nvim.desktop text/x-haskell
		xdg-mime default nvim.desktop text/x-ocaml
		xdg-mime default nvim.desktop text/x-elisp
		xdg-mime default nvim.desktop text/x-vim
		xdg-mime default nvim.desktop text/x-dockerfile
		xdg-mime default nvim.desktop text/x-env
		xdg-mime default nvim.desktop text/x-crontab
		xdg-mime default nvim.desktop application/json
		xdg-mime default nvim.desktop application/x-yaml
		xdg-mime default nvim.desktop application/xml
		xdg-mime default nvim.desktop application/x-sh
		xdg-mime default nvim.desktop application/x-shellscript
		xdg-mime default nvim.desktop application/x-perl
		xdg-mime default nvim.desktop application/x-php
		xdg-mime default nvim.desktop application/x-ruby
		xdg-mime default nvim.desktop application/x-lua
		xdg-mime default nvim.desktop application/x-nix
		xdg-mime default nvim.desktop application/x-sql
		xdg-mime default nvim.desktop application/x-troff
		xdg-mime default nvim.desktop application/x-patch
		xdg-mime default nvim.desktop application/x-desktop
	'';

	environment.systemPackages = with pkgs; [
		xdg-utils
		neovim
		chromium
	];
}
