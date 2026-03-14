{ config, pkgs, inputs, lib, ... }: {
	imports = [
		./modules
	];

	home = {
		username = "blocky";
		homeDirectory = "/home/blocky";
		stateVersion = "24.11";

		packages = with pkgs; [
            killall 
            go
            easyeffects
            pavucontrol
            tree
            nodejs
            playerctl
            eww
            cava
            cmatrix
			(discord.override {
				withOpenASAR = true;
                withVencord = true;
			})
			fastfetch
            btop
			kdePackages.breeze
            hyprpicker
			hypridle
            hyprshot
			zoxide
			eza
			starship
			git
			gh
			brightnessctl
			fzf
			ripgrep
			p7zip
            gcc
            tty-clock
            pokeget-rs
            pear-desktop
            cmake
            ccls
            gnumake
		];
	};

    xdg.desktopEntries."ytm" = {
        name = "YouTube Music";
        exec = "pear-desktop";
        terminal = false;
    };

    xdg.desktopEntries."discord" = {
        name = "Discord";
        exec = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --enable-gpu-rasterization --enable-zero-copy";
        terminal = false;
    };

    nixpkgs.config.allowUnfree = true;

    home.file.".config/discord/settings.json".force = true;
    home.file.".config/discord/settings.json".text = 
        let
            accent1 = config.lib.stylix.colors.base0F; # primary accent
            accent2 = config.lib.stylix.colors.base08; # secondary accent
        in builtins.toJSON {
                openasar = {
                    setup = true;
                    noTyping = true;
                    quickstart = true;
                    cmdPreset = "battery";
                    css = ''
                @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
                  .visual-refresh.theme-dark,
                  .visual-refresh .theme-dark {
                    --brand-500: #${accent1} !important;
                    --brand-460: #${accent1} !important;
                    --brand-530: #${accent2} !important;
                    --brand-560: #${accent2} !important;
                    --text-link: #${accent1} !important;
                    --text-brand: #${accent1};
                    --scrollbar-thin-thumb: #${accent1};
                    --scrollbar-auto-thumb: #${accent1};
                    --control-brand-foreground: #${accent1};
                    --control-brand-foreground-new: #${accent1};
                    --mention-foreground: #${accent1};
                    --__adaptive-focus-ring-color: #${accent1};
                    --control-primary-background-default: #${accent1};
                    --control-primary-background-hover: #${accent2};
                    --control-primary-background-active: #${accent2};
                    --logo-primary: #${accent1};
                    --background-accent: #${accent1} !important;
                    --blurple-50: #${accent1};
                    --blurple-60: #${accent2};
                    --opacity-blurple-8: #${accent1}14;
                    --opacity-blurple-16: #${accent1}29;
                    --opacity-blurple-24: #${accent1}3d;
                    --opacity-blurple-32: #${accent1}52;
                    --opacity-blurple-60: #${accent1}99;
                  }

                    '';
                };
                DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
                enableHardwareAcceleration = true;
            };
}
