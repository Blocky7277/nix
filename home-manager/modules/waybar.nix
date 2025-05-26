{config, lib, ...}: {
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                "layer" = "top";
                "position" = "top";
                "height" = 36;
                "margin-left" = 9;
                "margin-right" = 9;
                "margin-top" = 4;
                "margin-bottom" = -4;
                "spacing" = 1;
                "reload_style_on_change" = true;

                modules-left = [
                    "hyprland/workspaces"
                    "temperature"
                    "backlight"
                    "wireplumber"
                ];

                modules-center = [ "hyprland/window" ];

                modules-right = [
                    "battery"
                    "bluetooth"
                    "network"
                    "clock"
                ];

                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "*" = [
                            1
                            2
                            3
                            4
                            5
                        ];
                    };
                };

                "network" = {
                    interval = 30;
                    format-wifi = " ";
                    format-ethernet = " {ifname}";
                    format-disconnected = "⚠ Disconnected";
                    tooltip-format = "{ifname}: {essid} ({signalStrength}%)";
                    on-click = "exec kitty nmtui";
                };

                "clock" = {
                    interval = 60;
                    format = " {:%I:%M %p}";
                    format-alt = " {:%e %b %Y}";
                    tooltip = true;
                    tooltip-format = "<big>{:%B %Y}</big>\n<tt>{calendar}</tt>";
                };

                "temperature" = {
                    critical-threshold = 90;
                    interval = 30;
                    format = "{icon} {temperatureC}°C";
                    format-icons = [
                        ""
                        ""
                        ""
                        ""
                        "" 
                    ];
                    tooltip = true;
                };

                "backlight" = {
                    format = "{icon} {percent:>2}%";
                    format-icons = ["" "" "" ""  ""  ""  ""  ""  ""];
                };

                "wireplumber" = {
                    format = "{icon} {volume:>3}%";
                    format-muted = "󰖁 {volume:>3}%";
                    format-icons = ["" "" ""];
                };

                "battery" = {
                    interval = 60;
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    format-charging = "{capacity}% 󰂄";
                    format = "{icon} {capacity}%";
                    format-icons = [
                        "󰂎"
                        "󰁼"
                        "󰁿"
                        "󰂁"
                        "󰁹"
                    ];
                    tooltip = true;
                };

                "custom/power" = {
                    format = "{icon}";
                    format-icons = "";
                    exec-on-event = "true";
                    on-click = "$HOME/scripts/rofi-power";
                    tooltip-format = "Power Menu";
                };
                "bluetooth" = {
                    format-on = "󰂯";
                    format-off = "󰂲";
                    format-disabled = "󰂲";
                    format-connected = "󰂱 {num_connections}";
                    on-click = "exec blueman-manager";
                    tooltip-format-connected = "{device_enumerate}";
                    tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
                };
            };
        };
        style = ''
            @define-color bordercolor alpha(@color14, 1.0);
            @define-color bg alpha(@color8, 1.0);
            @define-color fg alpha(@foreground, 1.0);
            @define-color highlight alpha(@color15, 1.0);
            @define-color alert alpha(@color11, 1.0);
            @define-color disabled #A5A5A5;
            @define-color bg #1e1e2e;
            @define-color accent #f38ba8;
            @define-color fg #d20f39;

            * {
              min-height: 0;
              font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
              font-size: 1rem;
            }

            window#waybar {
              color: @fg;
              background: @bg;
              transition-property: background-color;
              transition-duration: 0.5s;
              border: 0.15rem solid @bordercolor;
              border-radius: 0.3rem;
            }

            tooltip {
                background: @bg;
                color: @fg;
                border-color: @fg;
                border-width: .1rem;
            } 

            button {
              /* Avoid rounded borders under each button name */
              border: none;
              border-radius: 0rem;
              padding: 0rem 0.4rem;
              margin: 0.4rem 0rem;
            }

            /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
            button:hover {
              background: inherit;
            }

            #workspaces {
                padding: 0.1rem .6rem;
            }

            #workspaces button {
              color: @accent;
            }

            #workspaces button.urgent {
              color: @alert;
            }
            #workspaces button.empty {
              color: @bordercolor;
            }
            
            #workspaces button.active {
              color: @fg;
            }
            
            .modules-left #workspaces button.focused,
            .modules-left #workspaces button.active {
              border: 0;
            }

            /*River Tags/Workspaces*/
            #tags {
              background-color: transparent;
              border-radius: 0rem;
              padding: 0rem 0.4rem;
            }

            #tags button {
              color: @bordercolor;
              background: @bg;

              /*If you need round border icons*/
              border-radius: 0rem;
              padding: 0rem 0.4rem;
              margin: 0.4rem 0rem;
            }

            #tags button.occupied {
              color: @fg;
            }

            #tags button.focused {
              color: @highlight;
            }

            #tags button.urgent {
              color: @alert;
            }

            #clock,
            #battery,
            #cpu,
            #memory,
            #disk,
            #temperature,
            #language,
            #backlight,
            #backlight-slider,
            #network,
            #pulseaudio,
            #wireplumber,
            #custom-media,
            #mode,
            #scratchpad,
            #custom-notification,
            #bluetooth,
            #custom-power,
            #custom-separator,
            #idle_inhibitor,
            #window,
            #mpd {
              padding: 0rem 0.4rem;
              margin: 0rem 0.4rem;
              color: @accent;
            }

            #clock {
                padding: 0rem 0.8rem 0 .4rem;
                color: @fg;
            }

            #custom-notification,
            #custom-wifi,
            #custom-kdeconnect,
            #custom-power,
            #idle_inhibitor {
              color: @bg;
            }

            #network.disconnected,
            #pulseaudio.muted,
            #wireplumber.muted {
              color: @alert;
            }

            #battery.charging,
            #battery.plugged {
              color: @activegreen;
            }

            label:focus {
              background-color: @bg;
            }

            #battery.critical:not(.charging) {
              background-color: @alert;
              color: @fg;
              animation-name: blink;
              animation-duration: 0.5s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
        '';
    };
}
