{ pkgs, ... }: {
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
    bat
    fx
    fd
    jq
    fzf
    docker
    goose
    postgresql_16
    micromamba
    act
    nvim-pkg
    asdf-vm
    tmux
    doggo
    ipcalc
    direnv
    git-absorb
  ];
  
  programs.mise.enable = false;

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm';
  
      return {
        font = wezterm.font_with_fallback {
          "Monaspace Krypton", 
          "Monaspace Neon", 
          "Rec Mono Linear", 
          "Sudo",
        },
        font_size = 12,
        harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
        audible_bell = "Disabled",
        automatically_reload_config = true,
        window_decorations = "RESIZE",
        color_scheme = "Catppuccin Mocha (Gogh)",
        force_reverse_video_cursor = true,
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
}
