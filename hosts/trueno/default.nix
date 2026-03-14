{ inputs, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "trueno";

    boot.loader = {
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
        };
        efi = {
            canTouchEfiVariables = true;
        };
    };

    system.stateVersion = "24.11";

    nix.settings.experimental-features = ["nix-command" "flakes"];

    users.users.blocky = {
        isNormalUser = true;
        description = "blocky";
        extraGroups = [ "networkmanager" "wheel" "dialout" ];
        shell = pkgs.fish;
    };

    environment.systemPackages = with pkgs; [
        inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
        lm_sensors
        sbctl
        libsForQt5.qt5.qtgraphicaleffects
        kdePackages.qtmultimedia
        libsForQt5.qt5.qtquickcontrols2
        kdePackages.breeze
        gtk4
        gtk3
        lshw
        sddm-themes.sddm-cyber
        ntfs3g
        ncdu
    ];

    boot.kernel.sysctl."fs.binfmt_misc.status" = 1;
    fileSystems."/mnt/c" =
        { device = "/dev/disk/by-partuuid/6fa9bb0b-445d-4abf-9206-90c5b3fdb8dc";
            fsType = "ntfs-3g";
            options = [ "rw" "uid=1000" "gid=100" "umask=000" "nofail" ];
        };

    swapDevices = [ { device = "/var/lib/swapfile";
        size = 20 * 1024;
    }
    ];

    boot.resumeDevice = "/dev/disk/by-uuid/0b091cf5-54b0-483e-8c72-39e12e3c61fd";

    powerManagement.enable = true;

    services.logind.settings.Login = {
        HandleLidSwitch = "suspend-then-hibernate";
        HandlePowerKey = "hibernate";
        HandlePowerKeyLongPress = "poweroff";
    };

    boot.kernelParams = ["resume_offset=26335232"];

    # Define time delay for hibernation
    systemd.sleep.settings.Sleep = {

        HibernateDelaySec = "30m";
    };
}
