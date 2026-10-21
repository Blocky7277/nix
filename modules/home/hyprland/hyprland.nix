{lib, config, ...}: 
let
    lua = lib.generators.mkLuaInline;
in
    {
    wayland.windowManager.hyprland.systemd.enable = false;
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        configType = "lua";
        settings = {
            # there is like zero documentation
            # so don't assume this is correct

            monitor = [
                {
                    output = "eDP-1";
                    mode = "preferred";
                    position = "0x0";
                    scale = "auto";
                }
                {
                    output = "HDMI-A-1";
                    mode = "preferred";
                    position = "0x-1080";
                    scale = "auto";
                }
                {
                    output = "DP-9";
                    mode = "3840x2160@60";
                    position = "0x-1440";
                    scale = "auto";
                }
                {
                    output = "DP-10";
                    mode = "3840x2160@60";
                    position = "0x-1440";
                    scale = "auto";
                }
            ];

            # Variables
            mod = {
                _var = "SUPER";
            };
            browser = {
                _var = "firefox";
            };
            terminal = {
                _var = "kitty";
            };
            fileManager = {
                _var = "yazi";
            };
            menu = {
                _var = "rofi -show drun || pkill rofi";
            };
            ssh = {
                _var = "rofi -show ssh || pkill rofi";
            };

            config = {
                general = {
                    gaps_in = 8;
                    gaps_out = 16;
                    border_size = 0;
                    # border_size = 2;

                    "col.active_border" = "rgb(${config.lib.stylix.colors.base09})";
                    "col.inactive_border" = "rgba(${config.lib.stylix.colors.base08}A1)";

                    resize_on_border = false;

                    allow_tearing = false;

                    layout = "dwindle";
                };

                animations = {
                    enabled = true;
                };
                decoration = {
                    rounding = 6;
                    rounding_power = 2;

                    # Change transparency of focused and unfocused windows
                    active_opacity = 1.0;
                    inactive_opacity = .9;

                    # shadow = {
                    # 	enabled = true;
                    # 	range = 4;
                    # 	render_power = 0;
                    # 	color = "rgba(${config.lib.stylix.colors.base00}CD)";
                    #                 sharp = true;
                    # };

                    blur = {
                        enabled = true;
                        size = 2;
                        passes = 2;
                        vibrancy = .4;
                        vibrancy_darkness = .2;
                    };
                };


                dwindle = {
                    preserve_split = true;
                };

                # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                misc = {
                    disable_splash_rendering = true;
                    force_default_wallpaper = 0;
                    disable_hyprland_logo = true;
                };

                input = {
                    kb_layout = "us";

                    follow_mouse = 1;

                    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

                    touchpad = {
                        natural_scroll = false;
                        scroll_factor = 0.7;
                    };

                    kb_options = "ctrl:nocaps";

                    touchpad.clickfinger_behavior = 1;
                };
            };




            #################
            ### AUTOSTART ###
            #################

            # Autostart necessary processes (like notifications daemons, status bars, etc.)
            # Or execute your favorite apps at launch like this:
            on = {
                _args = [
                    "hyprland.start"
                    (lua ''
                        function()
                            hl.exec_cmd("awww-daemon")
                            hl.exec_cmd("waybar &")
                            hl.exec_cmd("~/nix/assets/playernoti")
                            hl.exec_cmd("~/nix/assets/bg")
                            end
                    '')
                ];
            };

            #############################
            ### ENVIRONMENT VARIABLES ###
            #############################

            env = [ 
                {
                    _args = [
                        "XCURSOR_SIZE"
                        "24"
                    ];
                }
                {
                    _args = [
                        "HYPRCURSOR_SIZE"
                        "24"
                    ];
                }
                {
                    _args = [
                        "NIXOS_OZONE_WL"
                        "1"
                    ];
                }
                {
                    _args = [
                        "ELECTRON_OZONE_PLATFORM_HINT"
                        "wayland"
                    ];
                }
            ];


            # Animations
            curve = [
                {
                    _args = [
                        "easeOutQuint"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0.23, 1}, {0.32, 1} }";
                        }
                    ];
                }
                {
                    _args = [
                        "easeInOutCubic"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0.65, 0.05}, {0.36, 1} }";
                        }
                    ];
                }
                {
                    _args = [
                        "linear"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0, 0}, {1, 1} }";
                        }
                    ];
                }
                {
                    _args = [
                        "almostLinear"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0.5, 0.5}, {0.75, 1.0} }";
                        }
                    ];
                }
                {
                    _args = [
                        "quick"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0.15, 0}, {0.1, 1} }";
                        }
                    ];
                }
                {
                    _args = [
                        "bounce"
                        {
                            type = "bezier";
                            points = lib.generators.mkLuaInline "{ {0.35, 1.3}, {0.58, 1.0} }";
                        }
                    ];
                }
            ];

            animation = [
                { leaf = "global"; enabled = true; speed = 10; bezier = "default"; }
                { leaf = "border"; enabled = true; speed = 5.39; bezier = "easeOutQuint"; }
                { leaf = "windows"; enabled = true; speed = 3.4; bezier = "bounce"; }
                { leaf = "windowsIn"; enabled = true; speed = 2.2; bezier = "bounce"; style = "popin 10%"; }
                { leaf = "windowsOut"; enabled = true; speed = 1.49; bezier = "linear"; style = "popin 87%"; }
                { leaf = "fadeIn"; enabled = true; speed = 1.73; bezier = "almostLinear"; }
                { leaf = "fadeOut"; enabled = true; speed = 1.46; bezier = "almostLinear"; }
                { leaf = "fade"; enabled = true; speed = 3.03; bezier = "quick"; }
                { leaf = "layers"; enabled = true; speed = 3.81; bezier = "easeOutQuint"; }
                { leaf = "layersIn"; enabled = true; speed = 3.4; bezier = "easeOutQuint"; style = "fade"; }
                { leaf = "layersOut"; enabled = true; speed = 1.5; bezier = "linear"; style = "fade"; }
                { leaf = "fadeLayersIn"; enabled = true; speed = 1.79; bezier = "almostLinear"; }
                { leaf = "fadeLayersOut"; enabled = true; speed = 1.39; bezier = "almostLinear"; }
                { leaf = "workspaces"; enabled = true; speed = 1.94; bezier = "bounce"; style = "slidevert"; }
                { leaf = "workspacesIn"; enabled = true; speed = 1.35; bezier = "bounce"; style = "slide"; }
                { leaf = "workspacesOut"; enabled = true; speed = 1.1; bezier = "easeOutQuint"; style = "slide"; }
            ];



            #############
            ### INPUT ###
            #############

            # https://wiki.hyprland.org/Configuring/Variables/#input


            ###################
            ### KEYBINDINGS ###
            ###################

            # See https://wiki.hyprland.org/Configuring/Keywords/

            bind = [ 
                # Applications
                {
                    _args = [
                        (lua "mod..\" + Q\"")
                        (lua "hl.dsp.exec_cmd(terminal)")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + C\"")
                        (lua "hl.dsp.window.close()")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + E\"")
                        (lua "hl.dsp.exec_cmd(terminal..\" \"..fileManager)")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + F\"")
                        (lua "hl.dsp.exec_cmd(browser)")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + R\"")
                        (lua "hl.dsp.exec_cmd(menu)")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + S\"")
                        (lua "hl.dsp.exec_cmd(ssh)")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + L\"")
                        (lua "hl.dsp.exec_cmd(\"hyprlock -q\")")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + S\"")
                        (lua "hl.dsp.exec_cmd(\"hyprshot -m region -o ~/pictures/screenshots\")")
                    ];
                }

                {
                    _args = [
                        (lua "mod..\" + M\"")
                        (lua "hl.dsp.exec_cmd(\"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'\")")
                    ];
                }


                # Workspace Navigation 1
                {
                    _args = [
                        (lua "mod..\" + H\"")
                        (lua "hl.dsp.focus({direction = \"left\"})")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + L\"")
                        (lua "hl.dsp.focus({direction = \"right\"})")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + K\"")
                        (lua "hl.dsp.focus({direction = \"up\"})")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + J\"")
                        (lua "hl.dsp.focus({direction = \"down\"})")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + J\"")
                        (lua "hl.dsp.layout(\"togglesplit\")")
                    ];
                }

                # Magic Workspace
                {
                    _args = [
                        (lua "mod..\" + G\"")
                        (lua "hl.dsp.workspace.toggle_special(\"magic\")")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + G\"")
                        (lua "hl.dsp.window.move({ workspace = \"special:magic\" })")
                    ];
                }

                # Lid Switch
                {
                    _args = [
                        (lua "\"switch:on:Lid Switch\"")
                        (lua "hl.dsp.exec_cmd(\"hyprlock -q\")")
                    ];
                }


                # Move/Resize Windows
                {
                    _args = [
                        (lua "mod..\" + mouse:272\"")
                        (lua "hl.dsp.window.drag()")
                        (lua "{mouse = true}")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + mouse:272\"")
                        (lua "hl.dsp.window.resize()")
                        (lua "{mouse = true}")
                    ];
                }

                # Media / Misc
                {
                    _args = [
                        (lua "\"XF86Launch4\"")
                        (lua "hl.dsp.exec_cmd(\"~/nix/assets/changeprofiles\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86AudioRaiseVolume\"")
                        (lua "hl.dsp.exec_cmd(\"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86AudioLowerVolume\"")
                        (lua "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86AudioMute\"")
                        (lua "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86AudioMicMute\"")
                        (lua "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86MonBrightnessUp\"")
                        (lua "hl.dsp.exec_cmd(\"brightnessctl s 5%+\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86MonBrightnessDown\"")
                        (lua "hl.dsp.exec_cmd(\"brightnessctl s 5%-\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"SHIFT + XF86KbdBrightnessUp\"")
                        (lua "hl.dsp.exec_cmd(\"brightnessctl --device='asus::kbd_backlight' s 1+\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"SHIFT + XF86KbdBrightnessDown\"")
                        (lua "hl.dsp.exec_cmd(\"brightnessctl --device='asus::kbd_backlight' s 1-\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86KbdBrightnessUp\"")
                        (lua "hl.dsp.exec_cmd(\"playerctl next\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86KbdBrightnessDown\"")
                        (lua "hl.dsp.exec_cmd(\"playerctl previous\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86AudioPlay\"")
                        (lua "hl.dsp.exec_cmd(\"playerctl play-pause\")")
                    ];
                }
                {
                    _args = [
                        (lua "\"XF86Launch1\"")
                        (lua "hl.dsp.exec_cmd(\"playerctl play-pause\")")
                    ];
                }
                {
                    _args = [
                        (lua "mod..\" + SHIFT + P\"")
                        (lua "hl.dsp.exec_cmd(\"pgrep waybar && pkill waybar && eww open powermenu\")")
                    ];
                }

                # Workspace Navigation 2
            ] ++ (lib.concatMap (i:
                    let key = toString (lib.mod i 10);
                    in [
                        {
                            _args = [
                                (lua "mod..\" + ${key}\"")
                                (lua "hl.dsp.focus({workspace = ${toString i}})")
                            ];
                        }
                        {
                            _args = [
                                (lua "mod..\" + SHIFT + ${key}\"")
                                (lua "hl.dsp.window.move({workspace = ${toString i}})")
                            ];
                        }
                    ]
                ) (lib.range 1 10));

            # Custom mouse profile
            device = {
                name = "logitech-usb-receiver";
                accel_profile = "flat";
                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            };

            # Window and layer rules
            window_rule = [
                {
                    match = {
                        class = "rofi";
                    };

                    opacity = .8;
                    no_blur = false;
                }
                {
                    match = {
                        class = "vesktop";
                    };

                    opacity = .9;
                }
                {
                    match = {
                        class = "spotify";
                    };

                    opacity = .9;
                }
            ];

            layer_rule = [
                {
                    match = {
                        namespace = "waybar";
                    };

                    blur = true;
                }
                {
                    match = {
                        namespace = "rofi";
                    };

                    blur = true;
                }
                {
                    match = {
                        namespace = "vesktop";
                    };

                    blur = true;
                }
                {
                    match = {
                        namespace = "spotify";
                    };

                    blur = true;
                }
            ];
            workspace_rule = [
                {
                    workspace = "1";
                    layout = "master";
                }
            ];
        };
    };
}
