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
            libnotify
            pavucontrol
            python313
            pear-desktop
            tree
            nodejs
            playerctl
            eww
            killall 
            cava
            cmatrix
			firefox-bin
			(discord.override {
				withOpenASAR = true;
                withVencord = true;
			})
			fastfetch
            btop
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
			p7zip
            gcc
            tty-clock
            rmpc
            pokeget-rs
		];
	};

  	nixpkgs.config.allowUnfree = true;
}
