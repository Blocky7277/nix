{pkgs, ...}: {
	imports = [
		./hyprland
		./kitty.nix
        ./waybar.nix
        ./yazi.nix
        ./stylix.nix
        ./fish.nix
        ./wofi.nix
        ./dunst.nix
        ./tmux.nix
        ./gtkQt.nix
	];
}
