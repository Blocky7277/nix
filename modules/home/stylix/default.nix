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
        enable = true;
        autoEnable = false;
        flavor = "mocha";
        accent = "red";
    };

    stylix.targets = {
        kitty.enable = false;
        fish.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        yazi.enable = true;
        dunst.enable = false;
        rofi.enable = false;
        neovim.enable = false;
    };

    stylix.override = {
        base00 = "#282828";
    };
    stylix.targets.vesktop.colors.override = {
        base01 = config.lib.stylix.colors.base00;
    };
    stylix.targets.firefox.colors.override = {
        base01 = config.lib.stylix.colors.base00;
    };
}
