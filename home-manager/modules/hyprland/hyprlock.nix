{pkgs, lib, ...} : {
    programs.hyprlock = {
        enable = true;
        settings = {
            background = {
                path = "/home/blocky/nix/assets/hyprlock.jpg";
                blur_passes = 2;
                contrast = 1;
                brightness = 0.5;
                vibrancy = 0.35;
                vibrancy_darkness = 0.6;
            };

            # GENERAL
            general = {
                no_fade_in = true;
                no_fade_out = true;
                hide_cursor = false;
                grace = 0;
                disable_loading_bar = true;
            };

            # INPUT FIELD
            input-field = {
                size = "500, 100";
                outline_thickness = 2;
                dots_size = 0.28; # Scale of input-field height, 0.2 - 0.8
                dots_spacing = 0.4; # Scale of dots' absolute size, 0.0 - 1.0
                dots_center = true;
                outer_color = "rgba(0, 0, 0, 0)";
                inner_color = "rgba(0, 0, 0, 0.2)";
                font_color = "0xf0cdd6f4";
                fade_on_empty = false;
                rounding = -1;
                check_color = "rgb(204, 136, 34)";
                placeholder_text = "<i><span foreground=\"##cdd6f4\">Password</span></i>";
                hide_input = false;
                position = "0, -320";
                halign = "center";
                valign = "center";
            };

            # Profile Picture
            image = {
                path = "/home/blocky/blocky.png";
                size = 250;
                border_size = 5;
                border_color = "0xffcdd6f4";
                halign = "center";
                valign = "center";
            };

                label = [
                    #DATE
                    {
                        text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
                        color = "0xffcdd6f4";
                        font_size = 32;
                        font_family = "JetBrains Mono";
                        position = "0, 250";
                        halign = "center";
                        valign = "center";
                    }

                    # TIME
                    {
                        text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
                        color = "rgba(242, 243, 244, 0.75)";
                        font_size = 180;
                        font_family = "JetBrains Mono Extrabold";
                        position = "0, 400";
                        halign = "center";
                        valign = "center";
                    }

                    # CURRENT SONG
                    {
                        text = "cmd[update:5000] echo \"$(/home/blocky/nix/assets/nowplaying)\" ";
                        color = "0xffcdd6f4";
                        font_size = 24;
                        font_family = "Jetbrains Mono Nerd Font";
                        position = "0, 20";
                        halign = "center";
                        valign = "bottom";
                    }

                    # Greeting
                    {
                        text = "Good Morning, Blocky";
                        color = "0xffcdd6f4";
                        font_size = 35;
                        font_family = "JetBrains Mono";
                        position = "0, -205";
                        halign = "center";
                        valign = "center";
                    }

                    # BATTERY
                    {
                        text = "cmd[update:10000] echo \"$(/home/blocky/nix/assets/getbatt)\"";
                        color = "0xffcdd6f4";
                        font_size = 24;
                        font_family = "JetBrains Mono";
                        position = "-20, 20";
                        halign = "right";
                        valign = "bottom";
                    }

                    # NETWORK
                    {
                        text = "cmd[update:10000] echo \"$(/home/blocky/nix/assets/getnetwork)\"";
                        color = "0xffcdd6f4";
                        font_size = 24;
                        font_family = "JetBrains Mono";
                        position = "20, 20";
                        halign = "left";
                        valign = "bottom";
                    }
                ];
        };
    };
}
