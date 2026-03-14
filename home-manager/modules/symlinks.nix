{config, ...}: {
    home.file."music".source = config.lib.file.mkOutOfStoreSymlink "/mnt/c/Users/Jacob/Desktop/music";
    home.file."motorsports/pdm".source = config.lib.file.mkOutOfStoreSymlink "/mnt/c/Users/Jacob/Documents/GitHub/pdm-reborn";
    home.file."windows".source = config.lib.file.mkOutOfStoreSymlink "/mnt/c/Users/Jacob/";
}
