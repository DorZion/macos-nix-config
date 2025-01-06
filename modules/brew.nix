{ ... }: {
  homebrew = {
    enable = true;
    brewPrefix= "/opt/homebrew/bin";
    global = {
      brewfile = true;
    };
    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "koekeishiya/formulae"
    ];

    brews = [
      "awscli"
      "protobuf"
      "podman"
      "deskpad"
      "koekeishiya/formulae/yabai"
      "koekeishiya/formulae/skhd"
    ];
    
    casks = [
      "wezterm-nightly"
      "insomnia"
      "visual-studio-code"
      "slack"
      "telegram"
      "sublime-text"
      "zoom"
      "maccy"
      "nikitabobko/tap/aerospace"
    ];
  };
}
