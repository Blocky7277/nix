{
    description = "System config";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        stylix.url = "github:danth/stylix";

        catppuccin.url = "github:catppuccin/nix";

        awww.url = "git+https://codeberg.org/LGFae/awww";

        spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    };

    outputs = { self, nixpkgs, home-manager, stylix, catppuccin, nixos-wsl, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {	
        nixosConfigurations = {
            trueno = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs =  { inherit inputs system; };
                modules = [
                    ./hosts/trueno
                    ./modules/nixos/trueno.nix
                    catppuccin.nixosModules.catppuccin
                    stylix.nixosModules.stylix
                ];
            };
                
            levin = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs =  { inherit inputs system; };
                modules = [
                    ./hosts/levin
                    ./modules/nixos/levin.nix
                    nixos-wsl.nixosModules.wsl
                    catppuccin.nixosModules.catppuccin
                    stylix.nixosModules.stylix
                ];
            };
        };

        homeConfigurations = {
            "blocky@trueno" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    ./modules/home/trueno.nix
                    catppuccin.homeModules.catppuccin
                    inputs.spicetify-nix.homeManagerModules.default
                    stylix.homeModules.stylix
                ];
            };

            "blocky@levin" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    ./modules/home/levin.nix
                    inputs.catppuccin.homeModules.catppuccin
                    stylix.homeModules.stylix
                ];
            };
        };
    };
}
