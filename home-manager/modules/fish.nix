{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
            export EDITOR=nvim
			starship init fish | source
			zoxide init --cmd cd fish | source
			function fish_greeting; end
		'';
		shellAliases = {
			vim = "nvim";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			ls = "eza -a1";
		};
    };
}
