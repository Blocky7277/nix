{ config, lib, pkgs, ... }: {
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
            nvidia-vaapi-driver
            libva-vdpau-driver
            libvdpau-va-gl
            vulkan-loader
            vulkan-validation-layers
            mesa
        ];
        extraPackages32 = with pkgs; [
            pkgsi686Linux.libva
            pkgsi686Linux.vulkan-loader
            pkgsi686Linux.mesa
        ];
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

    hardware.nvidia.prime = {
        offload = {
            enable = true;
            enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:101:0:0";
    };

    services.supergfxd.enable = true;
}
