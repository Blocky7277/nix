{lib, ...}: {
    home.stateVersion = "25.11";

    imports = [
        ./common.nix
        ];

    stylix.targets.gtk.enable = false;
    stylix.targets.gnome.enable = false;
    stylix.targets.kde.enable = false;
    stylix.autoEnable = lib.mkForce false;
}
