{pkgs, lib, config, ...}: {
    stylix.enable = true;
    stylix.autoEnable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
    stylix.image = ../../assets/background.png; 

    stylix.polarity = "dark";

    stylix.cursor = {	
        package = pkgs.kdePackages.breeze;
        name = "breeze_cursors";
        size=24;
    };

	catppuccin = {
        flavor = "mocha";
        accent = "red";
        yazi.enable = true;
        rofi.enable = false;
    };

    stylix.targets = {
        kitty.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        firefox.enable = false;
        yazi.enable = false;
        dunst.enable = false;
        rofi.enable = false;
    };
}
