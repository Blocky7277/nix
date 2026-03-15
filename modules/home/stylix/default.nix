{pkgs, lib, config, ...}: {
    stylix.enable = true;
    stylix.autoEnable = true;
    
    stylix.image = ../../../assets/background.png; 

    stylix.polarity = "dark";

    stylix.cursor = {	
        package = pkgs.kdePackages.breeze;
        name = "breeze_cursors";
        size=24;
    };

	catppuccin = {
        flavor = "mocha";
        accent = "red";
        yazi.enable = false;
        rofi.enable = false;
    };

    stylix.targets = {
        kitty.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        yazi.enable = true;
        dunst.enable = false;
        rofi.enable = false;
        neovim.enable = false;
    };
}
