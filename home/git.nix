{...}: {
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
      format = "ssh";
      signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINmQa7F6EeADxUnScWCaWWCk0Fhc1hUqpgFm8lo0v/B6";
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        theme = "gruvbox-dark";
      };
    };
    lfs.enable = true;
  };
}
