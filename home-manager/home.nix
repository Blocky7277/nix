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
            bg = config.lib.stylix.colors.base00;
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
                        --background-base-lowest: #${bg}1a !important;
                        --background-base-lower: #${bg} !important;
                        --background-base-low: #${bg} !important;
                        --chat-background: #${bg} !important;
                        --chat-background-default: #${bg} !important;
                        --home-background: #${bg};
                        --modal-background: #${bg} !important;
                        --modal-footer-background: #${bg};
                        --app-frame-background: #${bg};
                        --background-secondary-alt: #${bg} !important;
                        --background-surface-high: #${bg} !important;
                        --bg-surface-raised: #${bg};
                        --background-gradient-highest: #${bg};
                        --channeltextarea-background: #${bg};
                        --custom-channel-members-bg: #${bg};
                        --background-code: #${bg};
                        --__header-bar-background: #${bg} !important;
                        --custom-channel-members-bg: #${bg};
                        --background-surface-highest: #${bg} !important;
                        --background-surface-higher: #${bg} !important;
                        --card-background-default: #${bg} !important;
                        --custom-status-bubble-background: #${bg} !important;
                        --custom-status-bubble-background-color: #${bg} !important;
                        --background-mod-subtle: rgba(0, 0, 0, 0.25) !important;
                        --background-mod-normal: rgba(0, 0, 0, 0.15) !important;
                        --interactive-background-selected: rgba(0, 0, 0, 0.2);
                        --interactive-background-hover: rgba(0, 0, 0, 0.15);
                        --input-background-default: #${bg};
                        --border-subtle: #${bg} !important;
                        --border-normal: #${bg} !important;
                    }

                    nav[class*="guilds_"] {
                        background-color: color-mix(in srgb, #${bg} 85%, black) !important;
                    }

                    div[class*="privateChannels_"],
                    div[class*="sidebar_"] {
                        background-color: color-mix(in srgb, #${bg} 85%, black) !important;
                    }

                    div[class*="appMount_"],
                    div[class*="app_"],
                    div[class*="layers_"] {
                        background-color: color-mix(in srgb, #${bg} 85%, black) !important;
                    }                    
                    div[class*="callContainer_"],
div[class*="video_"],
div[class*="call_"],
div[class*="wrapper_"][class*="call"] {
    background-color: #${bg} !important;
}
                    '';
                };
                DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING = true;
                enableHardwareAcceleration = true;
            };
}
