{pkgs, ...}: {
    programs.firefox = {
        enable = true;
        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value= true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
                EmailTracking = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
            DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
            SearchBar = "unified"; # alternative: "separate"
            EnableVerticalTabs = true;
            ExtensionSettings = {
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };
                "{47bf427e-c83d-457d-9b3d-3db4118574bd}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/nighttab/latest.xpi";
                    installation_mode = "force_installed";
                };
                "FirefoxColor@mozilla.com" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
                    installation_mode = "force_installed";
                };
                "jid1-BoFifL9Vbdl2zQ@jetpack" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
                    installation_mode = "force_installed";
                };
                "savewebpas@jeffersonscher.com" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/save-webp-as-png-or-jpeg/latest.xpi";
                    installation_mode = "force_installed";
                };
            };
        };

        profiles = {
            blocky = {
                extensions.force = true;
            };
        };
    };
    stylix.targets.firefox.profileNames = [ "blocky" ];
    stylix.targets.firefox.colorTheme.enable = true;
}
