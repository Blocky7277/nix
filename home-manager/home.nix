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
            python313
            python313Packages.numpy
            youtube-music
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
			htop
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
            tty-clock
            cbonsai
		];
	};

  	nixpkgs.config.allowUnfree = true;
}
