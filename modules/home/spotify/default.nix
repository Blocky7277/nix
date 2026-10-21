{pkgs, inputs, ...}: {
    programs.spicetify =
        let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
            {
            enable = true;
            wayland = true;

            enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle # shuffle+ (special characters are sanitized out of extension names)
                spicyLyrics
                aiBandBlocker
            ];
            enabledCustomApps = with spicePkgs.apps; [
            ];
            enabledSnippets = with spicePkgs.snippets; [
                hideRecentSearches
                oneko
            ];

        };
}

