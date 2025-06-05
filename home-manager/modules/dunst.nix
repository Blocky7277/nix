{
    services.dunst = {
        enable = true;
        settings = {
            global = {
                frame_color = "#d20f39";
                separator_color="frame";
                highlight = "#f38ba8";
                corner_radius = 8;
            };

            urgency_low = {
                background = "#1e1e2e";
                foreground = "#cdd6f4";
            };
            urgency_normal = {
                background = "#1e1e2e";
                foreground = "#cdd6f4";
            };

            urgency_critical = {
                background = "#1e1e2e";
                foreground = "#f38ba8";
                frame_color = "#d20f39";
            };
        };
    };
}
