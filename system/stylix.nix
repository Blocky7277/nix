{pkgs, ...}: {
	stylix.autoEnable = true;
	stylix.image = ../assets/background.png; 

	stylix.polarity = "dark";

	stylix.cursor = {	
		package = pkgs.kdePackages.breeze;
		name = "breeze_cursors";
		size=24;
	};


	catppuccin.flavor = "mocha";

	catppuccin.enable = true;

    catppuccin.accent = "red";

	catppuccin.sddm.enable = false;

}
