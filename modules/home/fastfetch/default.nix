{config, ...}: {
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                color = {
                    "1" = "#${config.lib.stylix.colors.base01}";
                    "2" = "#${config.lib.stylix.colors.base02}";
                    "3" = "#${config.lib.stylix.colors.base03}";
                    "4" = "#${config.lib.stylix.colors.base04}";
                    "5" = "#${config.lib.stylix.colors.base05}";
                    "6" = "#${config.lib.stylix.colors.base06}";
                };
            };
display = {
    color = {
      keys = "#${config.lib.stylix.colors.base04}";
      title = "#${config.lib.stylix.colors.base02}";
      host = "#${config.lib.stylix.colors.base02}";
    };
  };            modules = [
                "title"
                "separator"
                "os"
                "kernel"
                "uptime"
                "packages"
                "shell"
                "display"
                "de"
                "wm"
                "wmtheme"
                "theme"
                "icons"
                "font"
                "cursor"
                "terminal"
                "terminalfont"
                "cpu"
                "gpu"
                "memory"
                "swap"
                "disk"
                "localip"
                "battery"
                "poweradapter"
                "break"
                "colors"
            ];

        };
    };
}
