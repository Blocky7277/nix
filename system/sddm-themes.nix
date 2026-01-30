{ pkgs }:
let
	image = ../assets/lock.jpg;
	theme = ../assets/theme.conf;

in
{
    sddm-sugar-catppuccin = pkgs.stdenv.mkDerivation {
        pname = "sddm-sugar-catppuccin";
        version = "";
        dontBuild = true;
        src = pkgs.fetchFromGitHub {
            owner = "TiagoDamascena";
            repo = "sddm-sugar-catppuccin";
            rev = "59086d1b050b43a1cc0eee189268c6caaad8ac66";
            sha256 = "0rkpyl1qynzmpz092lzcpgji03wpkpnxs7c7ymhpxlbmx4n0xknc";
        };
        installPhase = ''
        mkdir -p $out/share/sddm/themes/sddm-sugar-catppuccin/
        cp -aR $src/* $out/share/sddm/themes/sddm-sugar-catppuccin/
        # rm background.jpg
        # cp ${image} $out/share/sddm/themes/sddm-sugar-catppuccin/background.jpg
        # rm theme.conf
        # cp ${theme} $out/share/sddm/themes/sddm-sugar-catppuccin/theme.conf
        '';
    };
    sddm-cyber = pkgs.sddm-astronaut.overrideAttrs (old: {
        installPhase = (old.installPhase or "") + ''
        rm $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
        cp ${./metadata.desktop} $out/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
        cp ${./theme.conf} $out/share/sddm/themes/sddm-astronaut-theme/theme.conf
        '';
    });
}
