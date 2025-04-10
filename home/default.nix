{
  pkgs,
  inputs,
  ...
}: {
  # import sub modules
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-index-database.hmModules.nix-index
    inputs.catppuccin.homeModules.catppuccin
    inputs.nvf.homeManagerModules.default
    ./shell.nix
    ./apps.nix
    ./core.nix
    ./git.nix
    ./nvim.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "dor";
    homeDirectory = "/Users/dor";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
