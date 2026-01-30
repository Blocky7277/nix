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
            inputs.rust-overlay.follows = "rust-overlay";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        stylix.url = "github:danth/stylix";

        catppuccin.url = "github:catppuccin/nix";

        awww.url = "git+https://codeberg.org/LGFae/awww";


        rust-overlay = {
            url = "github:oxalica/rust-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, home-manager, lanzaboote, stylix, catppuccin, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {	
        nixosConfigurations.NixOS-Laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs =  { inherit inputs system; };
            modules = [
                ./configuration.nix
                catppuccin.nixosModules.catppuccin
                stylix.nixosModules.stylix
                lanzaboote.nixosModules.lanzaboote
            ];
        };
        homeConfigurations.blocky = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { inherit inputs; };
            modules = [
                ./home-manager/home.nix
                stylix.homeModules.stylix
                catppuccin.homeModules.catppuccin
            ];
        };
    };
}
