{pkgs, ...}: {
    imports = [
        ./audio
        ./direnv
        ./hyprland
        ./networking
        ./nvidia
        ./power
        ./printing
        ./stylix
        # ./steam
        ./tailscale
        ./common.nix
        # ./ollama
    ];

    environment.systemPackages = with pkgs; [
        brightnessctl
    ];

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
            CPU_MAX_PERF_ON_BAT = 30;
            STOP_CHARGE_THRESH_BAT1 = 80;

        };
    };

    services.upower = {
        enable = true;
        percentageLow = 20;
        percentageCritical = 5;
        percentageAction = 3;
        criticalPowerAction = "PowerOff";
    }; 
    services.supergfxd.enable = true;

    # services.cardwired = {
    #     enable = true;
    #     settings = {
    #         auto_apply_gpu_state = true;
    #         experimental_nvidia_block = true;
    #         battery_auto_switch = true;
    #         battery_auto_switch_mode = "integrated";
    #         external_display_auto_switch = false;
    #     };
    # };
}
