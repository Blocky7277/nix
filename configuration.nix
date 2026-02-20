# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# TODO: Restructure file tree

{inputs, config, pkgs, lib, ... }:

let
sddm-themes = pkgs.callPackage ./system/sddm-themes.nix {};
grub-themes = pkgs.callPackage ./system/grub-themes.nix {};
in {
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ./system
        ];

    # Bootloader.
    # boot.loader.systemd-boot.enable = true;
    boot.loader = {
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            # theme = grub-themes.grub-cyber;
            useOSProber = true;
            gfxmodeEfi = "2880x1800";
        };
        efi = {
            canTouchEfiVariables = true;
        };
    };
    # boot.lanzaboote = {
    #     enable = true;
    #     pkiBundle = "/var/lib/sbctl";
    # };

    nix.settings.experimental-features = ["nix-command" "flakes"];

    networking.hostName = "NixOS-Laptop"; # Define your hostname.


    # Enable networking
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true; 
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

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

    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm = {
        enable = true;
        extraPackages = with pkgs; [
            sddm-themes.sddm-cyber
        ];
        theme = "sddm-astronaut-theme";
        settings = {
            Theme = {
                Current = "sddm-astronaut-theme";
                CursorTheme = "breeze_cursors";
                CursorSize = 48;
            };
        };
        wayland.enable = true;
    };

    nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.blocky = {
        isNormalUser = true;
        description = "blocky";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];
    };

    programs.bash = {
        interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
        '';
    };

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        neovim 
        inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
        lm_sensors
        home-manager
        sbctl
        libsForQt5.qt5.qtgraphicaleffects
        kdePackages.qtmultimedia
        libsForQt5.qt5.qtquickcontrols2
        kdePackages.breeze
        gtk4
        gtk3
        lshw
        sddm-themes.sddm-cyber
        grub-themes.grub-cyber
    ];

    services.upower = {
        enable = true;
        percentageLow = 20;
        percentageCritical = 5;
        percentageAction = 3;
        criticalPowerAction = "PowerOff";
    }; 

    services.tlp = {
        enable = true;
        pd.enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 40;
            STOP_CHARGE_THRESH_BAT1 = 80;

        };
    };


    fonts.packages = with pkgs; [
        fira-code
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        d2coding
        font-awesome
    ];


    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

}
