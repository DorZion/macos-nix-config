{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    ripgrep
    httpie
    aws-vault
    htop
    btop
    gnupg
    mongodb-tools
    gh
    fx
    fd
    jq
    fzf
    docker
    goose
    postgresql_16
    micromamba
    act
    asdf-vm
    tmux
    doggo
    ipcalc
    direnv
    git-absorb
    mkcert
    nss.tools
    git-absorb
    mergiraf
  ];

  programs.zoxide.enable = true;

  programs.bat.enable = true;

  programs.helix = {
    enable = true;
  };

  programs.nix-index-database.comma.enable = true;

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm';

      return {
        font = wezterm.font_with_fallback {
          "CommitMono",
          "Monaspace Krypton",
          "Monaspace Neon",
          "Rec Mono Linear",
          "Sudo",
        },
        font_size = 12,
        --harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
        harfbuzz_features = { 'ss03 on', 'ss04 on', 'ss05 on', 'cv02 on', 'cv08 on' },
        audible_bell = "Disabled",
        automatically_reload_config = true,
        window_decorations = "RESIZE",
        --color_scheme = "Catppuccin Mocha (Gogh)",
        color_scheme = "GruvboxDarkHard",
        force_reverse_video_cursor = true,
        visual_bell = {
          fade_in_function = 'EaseIn',
          fade_in_duration_ms = 150,
          fade_out_function = 'EaseOut',
          fade_out_duration_ms = 150,
          target = 'CursorColor',
        },
        default_prog = { '/etc/profiles/per-user/dor/bin/fish' },

        unix_domains = {
          {
            name = 'unix',
          },
        },
        default_gui_startup_args = { 'connect', 'unix' }
      }
    '';
  };

  home.file.".config/ghostty/config".text = ''
    theme = "catppuccin-mocha"

    font-family = "CommitMono"
    font-feature = "ss03"
    font-feature = "ss04"
    font-feature = "ss05"
    font-feature = "cv02"
    font-feature = "cv08"

    cursor-style-blink = false
    cursor-invert-fg-bg = true

    shell-integration = fish
  '';

  home.file.".config/yabai/yabairc".source = ./yabairc;
  home.file.".config/yabai/yabairc".executable = true;
  home.file.".config/skhd/skhdrc".source = ./skhdrc;
  home.file.".config/skhd/skhdrc".executable = true;
  home.file.".config/borders/bordersrc".source = ./bordersrc;
  home.file.".config/borders/bordersrc".executable = true;
  home.file.".config/aerospace/aerospace.toml".source = ./aerospace.toml;
}
