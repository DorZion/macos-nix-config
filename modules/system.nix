{pkgs, ...}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    primaryUser = "dor";
    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock
      CustomUserPreferences = {
        #NSStatusItemSpacing = 6;

        kCFPreferencesAnyApplication = {
          TSMLanguageIndicatorEnabled = 0;
        };

      };
    };
    stateVersion = 5;
  };

  fonts = {
    packages = with pkgs; [jetbrains-mono sudo-font commit-mono hack-font];
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = [
    pkgs.zsh
    pkgs.fish
  ];
}
