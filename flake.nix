{
	description = "System config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    		lanzaboote = {
			url = "github:nix-community/lanzaboote/v0.4.2";

			# Optional but recommended to limit the size of your system closure.
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland.url = "github:hyprwm/Hyprland";

		stylix.url = "github:danth/stylix";

		catppuccin.url = "github:catppuccin/nix";

	};

	outputs = { self, nixpkgs, home-manager, lanzaboote, stylix, catppuccin, ... } @ inputs:
		let
			system = "x86_64-linux";
		in {	

		nixosConfigurations.NixOS-Laptop = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs =  { inherit inputs system; };
			modules = [
			./configuration.nix
			catppuccin.nixosModules.catppuccin
			stylix.nixosModules.stylix
          		lanzaboote.nixosModules.lanzaboote
			({ pkgs, lib, ... }: {

			 environment.systemPackages = [
			 # For debugging and troubleshooting Secure Boot.
			 pkgs.sbctl
			 ];

			 # Lanzaboote currently replaces the systemd-boot module.
			 # This setting is usually set to true in configuration.nix
			 # generated at installation time. So we force it to false
			 # for now.
			 boot.loader.systemd-boot.enable = lib.mkForce false;

			 boot.lanzaboote = {
			 enable = true;
			 pkiBundle = "/var/lib/sbctl";
			 };
			 })
			];
		};
		homeConfigurations.blocky = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [
			./home-manager/home.nix
			catppuccin.homeModules.catppuccin
			];
		};
	};
}
