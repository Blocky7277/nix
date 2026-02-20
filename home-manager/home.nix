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
            tree
            nodejs
            playerctl
            eww
            killall 
            cava
            cmatrix
			firefox-bin
			(discord.override {
				# withOpenASAR = true;
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
            pokeget-rs
            pear-desktop
            cmake
            ccls
            gnumake
		];
	};

    xdg.desktopEntries."ytm" = {
        name = "YouTube Music";
        exec = "pear-desktop";
        terminal = false;
    };

    xdg.desktopEntries."discord" = {
        name = "Discord";
        exec = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --enable-gpu-rasterization --enable-zero-copy";
        terminal = false;
    };

  	nixpkgs.config.allowUnfree = true;
}
