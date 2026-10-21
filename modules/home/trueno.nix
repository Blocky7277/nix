{pkgs, ...}: {
    home.stateVersion = "24.11";

    imports = [
        ./common.nix
        ./direnv
        ./dunst
        ./firefox
        ./gtkQt
        ./hyprland
        ./kitty
        ./rofi
        ./spotify
        ./symlinks
        ./waybar
        ./libreoffice
        ./discord
        ./rmpc
        ./fastfetch
        ];

    home.packages = with pkgs; [
        playerctl
        eww
        easyeffects
        picard
        feishin
        stm32cubemx
        godot
    ];

}
