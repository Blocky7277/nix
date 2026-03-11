{pkgs, inputs, ...}: {
    home.packages = with pkgs; [

    ];
    programs.spicetify =
        let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
            {
            enable = true;

            enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle # shuffle+ (special characters are sanitized out of extension names)
                powerBar
                beautifulLyrics
                aiBandBlocker
            ];
            enabledCustomApps = with spicePkgs.apps; [
            ];
            enabledSnippets = with spicePkgs.snippets; [
                spinningCdCoverArt
                defaultProgressBar
                dynamicSearchBar
            ];

            # theme = spicePkgs.themes.catppuccin;
            # colorScheme = "mocha";
        };
}
