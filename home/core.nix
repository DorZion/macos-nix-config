{ ... }: {
  programs.vim = {
    enable = false;
    defaultEditor = false;
    #vimAlias = true;
  };

  programs.nix-index.enable = false;
  home.shellAliases = {
#    docker = "podman";
  };
}
