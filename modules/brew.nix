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
      "koekeishiya/formulae/yabai"
      "koekeishiya/formulae/skhd"
    ];
    
    casks = [
      "wezterm-nightly"
      "insomnia"
      #"intellij-idea-ce"
      "visual-studio-code"
      "chromium"
      "slack"
      "telegram"
      #"notion"
      "barrier"
      #"mongodb-compass"
      "rectangle"
      "sublime-text"
      "zoom"
      "min"
    ];
  };
}
