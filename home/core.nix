{ ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    #vimAlias = true;
  };

  programs.nix-index.enable = false;
  home.shellAliases = {
    docker = "podman";
  };
}
