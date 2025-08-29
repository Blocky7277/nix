{pkgs, ...}: {	
    qt = {
        enable = true;
    };

    gtk.enable = true;

    gtk.cursorTheme.package = pkgs.kdePackages.breeze;
    gtk.cursorTheme.name = "breeze_cursors";

    gtk.iconTheme.name = "adwaita-icon-theme";
    gtk.iconTheme.package = pkgs.adwaita-icon-theme;
}
