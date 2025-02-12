{...}: {
  programs.git = {
    enable = true;
    userEmail = "DorZion@users.noreply.github.com";
    userName = "Dor Zion";
    extraConfig = {
      pull.rebase = true;
      core.ignorecase = false;
      core.editor = "nvim";
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    };
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINmQa7F6EeADxUnScWCaWWCk0Fhc1hUqpgFm8lo0v/B6";
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
