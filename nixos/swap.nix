{
    swapDevices = [
        {
            device = "/var/lib/swapfile";
            size = 20 * 1024;
        }
    ];

    boot.kernelParams = ["resume_offset=26335232"];

    boot.resumeDevice = "/dev/disk/by-uuid/0b091cf5-54b0-483e-8c72-39e12e3c61fd";

    powerManagement.enable = true;

    services.logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandlePowerKey = "hibernate";
        HandlePowerKeyLongPress = "poweroff";
    };

    environment.etc."systemd/system-sleep/99-posthiber" = {
        source = ../assets/posthiber;
        mode = "0755";
    };
}
