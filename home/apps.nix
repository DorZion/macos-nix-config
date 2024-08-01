{ pkgs, ... }: {
  home.packages = with pkgs; [
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
  ];
  
  programs.mise.enable = false;

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm';
  
      return {
        font = wezterm.font("Rec Mono Linear"),--wezterm.font("Sudo"),
        -- font_rules = {
        --   {
        --     intensity = "Bold",
        --     font = wezterm.font("JetBrains Mono", { weight = "Bold" })
        --   }
        -- },
        font_size = 12,
        harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
        --freetype_load_target = "Light",
        --freetype_render_target = "HorizontalLcd",
        audible_bell = "Disabled",
        automatically_reload_config = true,
        window_decorations = "RESIZE",
        color_scheme = "Rosé Pine (Gogh)",
        force_reverse_video_cursor = true,
        default_prog = { '/etc/profiles/per-user/dor/bin/fish' },
      }
    '';
  };
}
