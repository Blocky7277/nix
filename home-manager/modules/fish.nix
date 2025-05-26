{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
            export EDITOR=nvim
			function last_history_item; echo $history[1]; end
			abbr -a !! --position anywhere --function last_history_item
			starship init fish | source
			zoxide init --cmd cd fish | source
			function fish_greeting; end
		'';
		shellAliases = {
			vim = "nvim";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			ls = "eza -a1";
			please = "sudo $history[1]";
		};
    };
}
