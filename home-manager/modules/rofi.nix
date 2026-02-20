{ config, ... }:{
    programs.rofi = {
        enable = true;
        terminal = "kitty";
        theme = let
            inherit (config.lib.formats.rasi) mkLiteral;
            stylix = config.lib.stylix.colors;
        in {
            "*" = {
                bg = mkLiteral "#${stylix.base00}";
                bgt = mkLiteral "#${stylix.base00}98";
                t = mkLiteral "transparent";
                fg = mkLiteral "#${stylix.base08}";
                selected-bg = mkLiteral "@fg";
                selected-fg = mkLiteral "@bg";
                active = mkLiteral "#a9b665";
                urgent = mkLiteral "#fb4934";
                background-color = mkLiteral "@t";
            };

            "window" = {
                fullscreen = true;
                padding = mkLiteral "35% 30%";
                background-color = mkLiteral "@bgt";
                border-color = mkLiteral "@t";
            };

            "listview" = {
                border = mkLiteral "0 0 0 0";
                padding = mkLiteral "23 0 0";
                scrollbar = true;
            };

            "scrollbar" = {
                width = mkLiteral "4px";
                border = mkLiteral "0";
                handle-color = mkLiteral "@fg";
                handle-width = mkLiteral "8px";
                padding = mkLiteral "0 5";
            };

            "entry" = {
                text-color = mkLiteral "@fg";
                placeholder = "";
            };

            "textbox" = {
                text-color = mkLiteral "@fg";
            };

            "element" = {
                border = mkLiteral "0";
                padding = mkLiteral "2px";
                text-color = mkLiteral "@fg";
            };

            "element.normal.normal" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@fg";
            };

            "element-text" = {
                text-color = mkLiteral "@fg";
            };

            "element.normal.urgent" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@urgent";
            };

            "element.normal.active" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@active";
            };

            "element.selected.normal" = {
                background-color = mkLiteral "@selected-bg";
                text-color = mkLiteral "@selected-fg";
            };

            "element-text.selected.normal" = {
                text-color = mkLiteral "@selected-fg";
            };

            "element.selected.urgent" = {
                background-color = mkLiteral "@selected-bg";
                text-color = mkLiteral "@urgent";
            };

            "element.selected.active" = {
                background-color = mkLiteral "@selected-bg";
                text-color = mkLiteral "@selected-fg";
            };

            "element.alternate.normal" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@fg";
            };

            "element.alternate.urgent" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@urgent";
            };

            "element.alternate.active" = {
                background-color = mkLiteral "@t";
                text-color = mkLiteral "@active";
            };

            "sidebar" = {
                border = mkLiteral "2px 0 0";
                border-color = mkLiteral "@fg";
            };

            "inputbar" = {
                spacing = mkLiteral "0";
                text-color = mkLiteral "@fg";
                padding = mkLiteral "2px";
                children = map mkLiteral [ "prompt" "textbox-prompt-sep" "entry" "case-indicator" ];
            };

            "case-indicator, entry, prompt, button" = {
                spacing = mkLiteral "0";
                text-color = mkLiteral "@fg";
            };

            "button.selected" = {
                background-color = mkLiteral "@bg";
                text-color = mkLiteral "@fg";
            };

            "textbox-prompt-sep" = {
                expand = false;
                str = ":";
                text-color = mkLiteral "@fg";
                margin = mkLiteral "0 0.3em 0 0";
            };
        };   
    };
}
