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
        # ./mpd.nix
        # ./rmpc.nix
	];
}
