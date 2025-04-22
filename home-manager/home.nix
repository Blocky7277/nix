{ config, pkgs, inputs, ... }: {
	imports = [
		./modules
	];
	home = {
		username = "blocky";
		homeDirectory = "/home/blocky";
		stateVersion = "24.11";
		packages = with pkgs; [	
			kitty
			nautilus
			neofetch
			htop
			spotify
			kdePackages.breeze
			hyprlock
			hypridle
			lf
			zoxide
			eza
			starship
			git
		];
	};

  	nixpkgs.config.allowUnfree = true;

	qt.enable = true;
	
	gtk.enable = true;
        catppuccin.gtk = {
	      flavor = "mocha";
	      accent = "red";
	      size = "standard";
	      tweaks = [ "normal" ];
	};

	gtk.cursorTheme.package = pkgs.kdePackages.breeze;
	gtk.cursorTheme.name = "breeze_cursors";
	gtk.cursorTheme.size=24;

	programs.fish = {
		enable = true;
		shellAliases = {
			vim = "nvim";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/.";
		};
	};
}
