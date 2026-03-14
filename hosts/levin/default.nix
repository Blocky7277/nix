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
        packages = with pkgs; [
        ];
    };
}
