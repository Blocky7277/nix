{ config, pkgs, inputs, lib, ... }: {
	imports = [
		./modules
	];

	home = {
		username = "blocky";
		homeDirectory = "/home/blocky";
		stateVersion = "24.11";
		packages = with pkgs; [
            go
            nodejs
            playerctl
            eww
            killall 
            cava
            cmatrix
			firefox-bin
			(discord.override {
				withOpenASAR = true;
			})
			fastfetch
			htop
			spotify
			kdePackages.breeze
            hyprpicker
			hypridle
			hyprshot
			zoxide
			eza
			starship
			git
			gh
			brightnessctl
			fzf
			ripgrep
			gimp
			p7zip
            gcc
		];
	};

  	nixpkgs.config.allowUnfree = true;

	qt = {
		enable = true;
	};

	gtk.enable = true;
        catppuccin.gtk = {
	      flavor = "mocha";
	      accent = "red";
	      size = "standard";
	      tweaks = [ "normal" ];
	};

	gtk.cursorTheme.package = pkgs.kdePackages.breeze;
	gtk.cursorTheme.name = "breeze_cursors";

    gtk.iconTheme.name = "adwaita-icon-theme";
    gtk.iconTheme.package = pkgs.adwaita-icon-theme;
}
