{
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
    systemd.sleep.extraConfig = ''
    HibernateDelaySec=20m
    '';

    # environment.etc."systemd/system-sleep/99-posthiber" = {
    #     source = ../assets/posthiber;
    #     mode = "0755";
    # };
    boot.initrd.postResumeCommands = ''
        lvl=$(brightnessctl --device='asus::kbd_backlight' g)
        brightnessctl --device='asus::kbd_backlight' s $lvl
    '';
}
