{inputs, pkgs, ...}: {
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

