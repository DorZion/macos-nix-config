{...}: {
  homebrew = {
    enable = true;
    brewPrefix = "/opt/homebrew/bin";
    global = {
      brewfile = true;
    };
    taps = [
      "koekeishiya/formulae"
    ];

    brews = [
      "awscli"
      "protobuf"
      "podman"
      #"deskpad"
      "koekeishiya/formulae/yabai"
      "koekeishiya/formulae/skhd"
    ];

    casks = [
      "wezterm@nightly"
      "visual-studio-code"
      #"slack"
      #"telegram"
      "sublime-text"
      "maccy"
      "nikitabobko/tap/aerospace"
    ];
  };
}
