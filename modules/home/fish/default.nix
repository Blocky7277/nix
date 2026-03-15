{
    programs.starship = {
        enable = true;
        enableFishIntegration = true;
    };
    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        options = [
            "--cmd cd"
        ];
    };
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
            export EDITOR=nvim
            
            function fish_greeting
                set pkmn "gengar" "greninja" "scolipede" "decidueye" "wooper" "eevee" "snorlax" "minun" "necrozma" "munchlax" "rowlet"\
                    "rayquaza" "mudkip" "piplup" "totodile" "togepi" "treecko"
                set color 35 34 31 32 35 37 34 34 37 34 32 31 34 36 36 33 36
                set args "-f mega" "-s -f ash" "-s" "-s" "-s" "-s" "-s" "" "-s -f ultra" "-s" "-s" "-f mega -s" "" "-s" "-s" "-s" "-s"
                set r $(random 1 $(count $pkmn))
                echo
                eval pokeget $pkmn[$r] $args[$r] --hide-name
                echo
                echo -e "\e[$color[$r]mWelcome Back Blocky...\e[0m"
            end
            
            function greet
                clear
                fish_greeting
            end

            function upg
                sudo nix flake update --flake ~/nix
                sudo nixos-rebuild switch --flake ~/nix/
                home-manager switch --flake ~/nix/
            end

            function garbage
                sudo ls > /dev/null
                home-manager expire-generations -d
                nix-collect-garbage -d
                sudo nix-collect-garbage -d
            end
		'';
		shellAliases = {
			vim = "nvim";
            flake = "sudo nix flake update --flake ~/nix";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			hmrebuild = "home-manager switch --flake ~/nix/";
			ls = "eza -a1 --color=always --group-directories-first --icons";
            p = "~/nix/assets/getdrawnpwr";
            unzip = "7z +x";
            ssh = "kitty +kitten ssh";
		};
    };
}
