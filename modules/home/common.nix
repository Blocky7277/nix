{ config, pkgs, inputs, lib, ... }: {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
            killall 
            go
            tree
            cava
            cmatrix
			fastfetch
            btop
			zoxide
			eza
			starship
			git
			gh
			fzf
			ripgrep
			p7zip
            gcc
            tty-clock
            pokeget-rs
            cmake
            ccls
            gnumake
		];
}
