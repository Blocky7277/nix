{ config, lib, pkgs, ... }: {
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        # Open source drivers
        open = true;
        # Enable the Nvidia settings menu,
        nvidiaSettings = true;
    };
    services.supergfxd.enable = true;
}
