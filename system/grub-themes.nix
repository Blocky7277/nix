{ pkgs }:
{
    grub-cyber = pkgs.stdenv.mkDerivation {
        pname = "cyber-grub";
        version = "";
        dontBuild = true;
        src = pkgs.fetchFromGitHub {
            owner = "adnksharp";
            repo = "CyberGRUB-2077";
            rev = "6a5736ef44e4ede9bb403d78eafe7271dd2928db";
            sha256 = "1f61nkh6a2vwdaglzsbhj0pm5nrfq7qb1vx8g8wg19s1sbdaq8j7";
        };
        installPhase = ''
            cp -r $src $out
        '';
    };
    # Add here
}

