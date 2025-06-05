{pkgs, ...}:{
    programs.nix-ld.enable = true;

    programs.nix-ld.libraries = with pkgs; [
        cups
        xorg.libXfixes
        glib
        nss
        nspr
        dbus
        atk
        gtk3
        libdrm
        mesa
        alsa-lib
        libxkbcommon
        libuuid
        pango
        cairo
        gdk-pixbuf
        xorg.libxshmfence
        xorg.libX11
        xorg.libXext
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXcursor
    ];
}
