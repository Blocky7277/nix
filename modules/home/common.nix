{ config, pkgs, inputs, lib, ... }: {
    home = {
        username = "blocky";
        homeDirectory = "/home/blocky";
    };

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

    imports = [
        ./fish
        ./tmux
        ./stylix
        ./yazi
        ./nvim
    ];
}
