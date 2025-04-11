# nixos-launchers

nixos-launchers = fetchGit {
    url = "https://github.com/typovrak/nixos-launchers.git";
	ref = "main";
};

(import "${nixos-launchers}/configuration.nix")
