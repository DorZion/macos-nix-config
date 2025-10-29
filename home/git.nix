{...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "DorZion@users.noreply.github.com";
        name = "Dor Zion";
      };
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
    lfs.enable = true;
  };

  programs.delta = {
    enable = true;
    options = {
      line-numbers = true;
    };
  };
}
