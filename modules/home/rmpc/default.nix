{config, ...}: {
    services.playerctld.enable = true;
    services.mpd-mpris.enable = true;
    services.mpd = {
        enable = true;
        musicDirectory = "/home/blocky/music";
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "PipeWire"
            }
        '';
        network.startWhenNeeded = true;
    };
    programs.rmpc.enable = true;
}
