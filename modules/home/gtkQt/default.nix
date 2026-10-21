{pkgs, config, ...}: {	
    qt = {
        enable = true;
        style.name = "kvantum";
    };

    gtk.enable = true;

    # gtk.gtk4.theme = config.gtk.theme;

    gtk.cursorTheme.package = pkgs.kdePackages.breeze;
    gtk.cursorTheme.name = "breeze_cursors";

}
