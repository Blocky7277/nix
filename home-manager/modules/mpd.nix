{
    services.mpd = {
        enable = true;
        musicDirectory = "/path/to/music";
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "My PipeWire Output"
              }
        '';

        # Optional:
        network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
    };
}
