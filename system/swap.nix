{
    swapDevices = [
        {
            device = "/var/lib/swapfile";
            size = 20 * 1024;
        }
    ];

    boot.kernelParams = ["resume_offset=26335232" "mem_sleep_default=deep"];

    boot.resumeDevice = "/dev/disk/by-uuid/0b091cf5-54b0-483e-8c72-39e12e3c61fd";

    powerManagement.enable = true;

    services.logind.settings.Login = {
        HandleLidSwitch = "suspend-then-hibernate";
        HandlePowerKey = "hibernate";
        HandlePowerKeyLongPress = "poweroff";
    };


    # Define time delay for hibernation
    systemd.sleep.extraConfig = ''
    HibernateDelaySec=30m
    SuspendState=mem
    '';

    # environment.etc."systemd/system-sleep/99-posthiber" = {
    #     source = ../assets/posthiber;
    #     mode = "0755";
    # };
}
