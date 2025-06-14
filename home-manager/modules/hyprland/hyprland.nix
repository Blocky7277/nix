{lib, config, ...}: {
	wayland.windowManager.hyprland.systemd.enable = false;
	wayland.windowManager.hyprland = {
		enable = true;
		package = null;
		portalPackage = null;
		settings = {
# Please note not all available settings / options are set here.
# For a full list, see the wiki

# You can split this configuration into multiple files
# Create your files separately and then link them to this file like this:
# source = ~/.config/hypr/myColors.conf


################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
			monitor = ",preferred,auto,auto";


###################
### MY PROGRAMS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/

# Set programs that you use
			"$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
			"$browser" = "firefox";
			"$terminal" = "kitty";
			"$fileManager" = "yazi";
			"$menu" = "pgrep wofi && pkill wofi || wofi";


#################
### AUTOSTART ###
#################

# Autostart necessary processes (like notifications daemons, status bars, etc.)
# Or execute your favorite apps at launch like this:

			exec-once = [ 
				"swww-daemon"
				"~/nix/assets/bg"
                "waybar &"
			];
# exec-once = nm-applet &
# exec-once = waybar & hyprpaper & firefox


#############################
### ENVIRONMENT VARIABLES ###
#############################

# See https://wiki.hyprland.org/Configuring/Environment-variables/

			env = [ 
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
			];

#####################
### LOOK AND FEEL ###
#####################

# Refer to https://wiki.hyprland.org/Configuring/Variables/

# https://wiki.hyprland.org/Configuring/Variables/#general
			general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 2;

# https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
				"col.active_border" = "rgb(d20f39)";
				"col.inactive_border" = "rgba(${config.lib.stylix.colors.base08}6A)";

# Set to true enable resizing windows by clicking and dragging on borders and gaps
				resize_on_border = false;

# Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
				allow_tearing = false;

				layout = "dwindle";
			};

# https://wiki.hyprland.org/Configuring/Variables/#decoration
			decoration = {
				rounding = 10;
				rounding_power = 2;

# Change transparency of focused and unfocused windows
				active_opacity = 1.0;
				inactive_opacity = 1.0;

				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};

# https://wiki.hyprland.org/Configuring/Variables/#blur
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

# https://wiki.hyprland.org/Configuring/Variables/#animations
			animations = {
				enabled = true;

# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

				bezier = [ 
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [ 
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 1%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, easeOutQuint, slide"
					"workspacesIn, 1, 1.21, easeOutQuint, slide"
					"workspacesOut, 1, 1.94, easeOutQuint, slide"
				];
			};

# Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
# "Smart gaps" / "No gaps when only"
# uncomment all if you wish to use that.
# workspace = w[tv1], gapsout:0, gapsin:0
# workspace = f[1], gapsout:0, gapsin:0
# windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
# windowrule = rounding 0, floating:0, onworkspace:w[tv1]
# windowrule = bordersize 0, floating:0, onworkspace:f[1]
# windowrule = rounding 0, floating:0, onworkspace:f[1]

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
			dwindle = {
				pseudotile = true ;
				preserve_split = true; 			};

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
			master = {
				new_status = "master";
			};

			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};


#############
### INPUT ###
#############

# https://wiki.hyprland.org/Configuring/Variables/#input
			input = {
				kb_layout = "us";

				follow_mouse = 1;

				sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

					touchpad = {
						natural_scroll = false;
					};

                kb_options = "ctrl:nocaps";

                touchpad.clickfinger_behavior = 1;
			};

# https://wiki.hyprland.org/Configuring/Variables/#gestures
			gestures = {
				workspace_swipe = false;
			};


###################
### KEYBINDINGS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/

			bind = [ 
				"$mainMod, Q, exec, $terminal"
				"$mainMod SHIFT, P, exec, (pgrep waybar && pkill waybar && eww open powermenu) || (eww open --toggle  powermenu && waybar &)"
				"$mainMod, C, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, E, exec, kitty $fileManager"
				"$mainMod SHIFT, L, exec, hyprlock -q"
				"$mainMod, F, exec, $browser"
				"$mainMod, V, togglefloating,"
				"$mainMod, R, exec, $menu"
				"$mainMod, P, pseudo, # dwindle"
				"$mainMod SHIFT, J, togglesplit, # dwindle"
				"$mainMod, h, movefocus, l"
				"$mainMod, l, movefocus, r"
				"$mainMod, k, movefocus, u"
				"$mainMod, j, movefocus, d"
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
                ",switch:on:Lid Switch, exec, hyprlock -q"
				];

			bindm = [ 
				"$mainMod, mouse:272, movewindow"
				"$mainMod SHIFT, mouse:272, resizewindow"
			];

			bindel = [ 
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl -d amdgpu_bl2 s 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -d amdgpu_bl2 s 5%-"
			];

			bindl = [ 
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];
##############################
### WINDOWS AND WORKSPACES ###
##############################

			windowrule = [ 
				"suppressevent maximize, class:.*"
				"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];
		};
	};
    home.sessionVariables.NIXOS_OZONE_WL = "1";
}
