{config, ...}: {
    programs.neovim = {
        enable = true;
        withRuby = false;
        withPython3 = false;
        initLua = ''
            require("blocky")
            # Generated Theme Colors
            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#${config.lib.stylix.colors.base09}" })
            vim.api.nvim_set_hl(0, "AlphaAccent", { fg = "#${config.lib.stylix.colors.base08}" })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#${config.lib.stylix.colors.base08}" })
        '';
    };
}
