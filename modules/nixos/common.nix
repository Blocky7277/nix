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

    nix.settings.experimental-features = ["nix-command" "flakes"];

    environment.systemPackages = with pkgs; [
        neovim 
        home-manager
        gcc
        git
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

    imports = [
        ./stylix
    ];

    security.pki.certificates = [
        ''
        -----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----
        ''
    ];
}
