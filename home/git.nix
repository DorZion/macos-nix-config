{ ... }: {
  programs.git = {
    enable = true;
    userEmail = "DorZion@users.noreply.github.com";
    userName = "Dor Zion";
    extraConfig = {
      pull.rebase = true;
      core.ignorecase = false;
      core.editor = "nvim";
    };
    signing = {
      key = null;
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
      };
    };
    lfs.enable = true;
  };
}
