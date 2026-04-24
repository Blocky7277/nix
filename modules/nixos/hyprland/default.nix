{inputs, pkgs, ...}: {
    services.xserver.enable = true;
    services.displayManager.sddm = {
        enable = true;
        # FIXME: derivations needed
        # extraPackages = with pkgs; [
        #     sddm-themes.sddm-cyber
        # ];
        # theme = "sddm-astronaut-theme";
        settings = {
            Theme = {
                # Current = "sddm-astronaut-theme";
                CursorTheme = "breeze_cursors";
                CursorSize = 48;
            };
        };
        wayland.enable = true;
    };

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

	programs.hyprland = {
		enable = true;
		withUWSM = true;
        # set the flake package
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # make sure to also set the portal package, so that they are in sync
		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
	security.pam.services.hyprlock = {};
}
