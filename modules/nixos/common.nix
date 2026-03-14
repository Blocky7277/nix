{inputs, config, pkgs, lib, ... }: {
    # Set your time zone.
    time.timeZone = "America/Chicago";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    programs.fish.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim 
        home-manager
    ];

    fonts.packages = with pkgs; [
        fira-code
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        d2coding
        font-awesome
    ];

    fonts.fontconfig = {
        defaultFonts = {
            monospace = [ "JetBrainsMonoNL Nerd Font" ];
        };
    };
}
