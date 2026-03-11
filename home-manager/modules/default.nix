{pkgs, ...}: {
	imports = [
		./hyprland
		./kitty.nix
        ./waybar.nix
        ./yazi.nix
        ./stylix.nix
        ./fish.nix
        ./rofi.nix
        ./dunst.nix
        ./tmux.nix
        ./gtkQt.nix
        ./symlinks.nix
        ./libreoffice.nix
        ./spotify.nix
        ./nvim.nix
        ./firefox.nix
	];
}
