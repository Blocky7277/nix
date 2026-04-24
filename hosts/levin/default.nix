{ inputs, pkgs, ... }: {
    networking.hostName = "levin";

    wsl = {
        enable = true;
        defaultUser = "blocky";
    };

    users.users.blocky = {
        isNormalUser = true;
        description = "blocky";
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
    };

    system.stateVersion = "25.11";
}
