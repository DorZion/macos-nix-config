{ ... }: {
  homebrew = {
    enable = true;
    brewPrefix= "/opt/homebrew/bin";
    global = {
      brewfile = true;
    };
    taps = [
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    brews = [
      "awscli"
      "protobuf"
      "podman"
      "koekeishiya/formulae/yabai"
    ];
    
    casks = [
      "wezterm-nightly"
      "insomnia"
      "intellij-idea-ce"
      "visual-studio-code"
      "chromium"
      "slack"
      "telegram"
      "slite"
      "dbeaver-community"
      "barrier"
      "mongodb-compass"
      "aws-vpn-client"
      "rectangle"
      "orion"
      "sublime-text"
      "zoom"
      "min"
    ];
  };
}
