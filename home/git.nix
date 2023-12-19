{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "DorZion@users.noreply.github.com";
    userName = "Dor Zion";
    extraConfig = {
      pull.rebase = true;
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
  };
}
