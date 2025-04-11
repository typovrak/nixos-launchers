{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.launchers = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		cp ${./mimeapps.list} ${home}/.config/mimeapps.list
		chown ${username}:${group} ${home}/.config/mimeapps.list
		chmod 600 ${home}/.config/mimeapps.list

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

		cp ${pkgs.eog}/share/applications/org.gnome.eog.desktop ${home}/.local/share/applications/org.gnome.eog.desktop
		chown ${username}:${group} ${home}/.local/share/applications/org.gnome.eog.desktop
		chmod 700 ${home}/.local/share/applications/org.gnome.eog.desktop

		cp ${pkgs.evince}/share/applications/org.gnome.Evince-previewer.desktop ${home}/.local/share/applications/org.gnome.Evince-previewer.desktop
		chown ${username}:${group} ${home}/.local/share/applications/org.gnome.Evince-previewer.desktop
		chmod 700 ${home}/.local/share/applications/org.gnome.Evince-previewer.desktop

		cp ${pkgs.lollypop}/share/applications/org.gnome.Lollypop.desktop ${home}/.local/share/applications/org.gnome.Lollypop.desktop
		chown ${username}:${group} ${home}/.local/share/applications/org.gnome.Lollypop.desktop
		chmod 700 ${home}/.local/share/applications/org.gnome.Lollypop.desktop

		cp ${pkgs.celluloid}/share/applications/io.github.celluloid_player.Celluloid.desktop ${home}/.local/share/applications/io.github.celluloid_player.Celluloid.desktop
		chown ${username}:${group} ${home}/.local/share/applications/io.github.celluloid_player.Celluloid.desktop
		chmod 700 ${home}/.local/share/applications/io.github.celluloid_player.Celluloid.desktop
	'';

	environment.systemPackages = with pkgs; [
		xdg-utils
		neovim
		eog
		evince
		lollypop
		celluloid
		chromium
	];
}
