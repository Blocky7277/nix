{inputs, pkgs, ...}: {
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	security.pam.services.hyprlock = {};
}

