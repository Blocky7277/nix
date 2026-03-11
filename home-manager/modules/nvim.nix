{config, ...}: {
    programs.neovim.enable = true;
    programs.neovim.initLua = ''
        require("blocky")
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#${config.lib.stylix.colors.base0F}" })
        vim.api.nvim_set_hl(0, "AlphaAccent", { fg = "#${config.lib.stylix.colors.base08}" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#${config.lib.stylix.colors.base08}" })
'';
}
