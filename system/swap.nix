{pkgs, ...}: {
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
