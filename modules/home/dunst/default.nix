{config, ...}: {
    services.dunst = {
        enable = true;
        settings = {
            global = {
                frame_color = "#${config.lib.stylix.colors.base0F}";
                separator_color="frame";
                highlight = "#${config.lib.stylix.colors.base08}";
                corner_radius = 8;
            };

            urgency_low = {
                background = "#${config.lib.stylix.colors.base00}";
                foreground = "#cdd6f4";
            };
            urgency_normal = {
                background = "#${config.lib.stylix.colors.base00}";
                foreground = "#cdd6f4";
            };

            urgency_critical = {
                background = "#${config.lib.stylix.colors.base00}";
                foreground = "#f38ba8";
                frame_color = "#d20f39";
            };
        };
    };
}

