{pkgs, config, ...}: {
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
    docker
    goose
    postgresql_16
    micromamba
    act
    tmux
    doggo
    ipcalc
    git-absorb
    mkcert
    nss.tools
    mergiraf
    presenterm
    lunarvim
    git-who
    jujutsu
    yt-dlp
    clang-tools
    fq
    #somo
    gitu
    golangci-lint
  ];

  programs.direnv.enable = true;

  programs.mise.enable = true;

  programs.zoxide.enable = true;

  programs.fzf = {
    enable = true;
    enableFishIntegration = false;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Monokai Extended";
    };
  };

  programs.helix = {
    enable = true;
  };

  programs.nix-index-database.comma.enable = true;

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = true;

    settings.theme = "molokai-dark";
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm';
      local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez");

      --tabline.setup({
      --  theme = 'GruvboxDark',
      --})

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

  programs.kitty = {
    enable = true;
    enableGitIntegration = false;
    shellIntegration.mode = "no-cursor";
    darwinLaunchOptions = [
      "--listen-on=unix:/tmp/kitty-socket"
    ];
    font = {
      name = "CommitMono";
    };
    themeFile = "Monokai";

    settings = {
      font_size = 12.0;
      cursor = "none";
      cursor_shape = "block";
      cursor_blink_interval = 0;

      selection_foreground = "none";
      selection_background = "none";

      enable_audio_bell = false;
      visual_bell_duration = 0.2;

      tab_bar_edge = "top";
      tab_bar_style = "slant";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}{index}: {title}";

      hide_window_decorations = "titlebar-only";
      window_padding_width = 2;

      update_check_interval = 0;
    };

    extraConfig = ''
      map cmd+1 goto_tab 1
      map cmd+2 goto_tab 2
      map cmd+3 goto_tab 3
      map cmd+4 goto_tab 4
      map cmd+5 goto_tab 5 
      map cmd+6 goto_tab 6
      map cmd+7 goto_tab 7
      map cmd+8 goto_tab 8
      map cmd+9 goto_tab 9
      map cmd+0 goto_tab 10

      font_features CommitMono-Regular +ss03 +ss04 +ss05 +cv02 +cv04 +cv08
    '';
  };

  programs.alacritty = {
    enable = true;
    theme = "monokai_pro";
    settings = {
      font = {
        normal = {
          family = "CommitMono";
          style = "Regular";
        };
        bold = {
          family = "CommitMono";
        };
        italic = {
          family = "CommitMono";
        };
        size = 12.0;
        builtin_box_drawing = true;
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "Off";
        };
        unfocused_hollow = false;
      };

     # colors = {
     #   primary = {
     #     background = "#272822";
     #     foreground = "#f8f8f2";
     #   };
     #   normal = {
     #     black = "#272822";
     #     red = "#f92672";
     #     green = "#a6e22e";
     #     yellow = "#f4bf75";
     #     blue = "#66d9ef";
     #     magenta = "#ae81ff";
     #     cyan = "#a1efe4";
     #     white = "#f8f8f2";
     #   };
     #   bright = {
     #     black = "#75715e";
     #     red = "#f92672";
     #     green = "#a6e22e";
     #     yellow = "#f4bf75";
     #     blue = "#66d9ef";
     #     magenta = "#ae81ff";
     #     cyan = "#a1efe4";
     #     white = "#f9f8f5";
     #   };
     # };

      selection = {
        save_to_clipboard = true;
      };

      bell = {
        animation = "EaseOutExpo";
        duration = 200;
        color = "#ffffff";
      };

      window = {
        decorations = "Buttonless";
        padding = {
          x = 2;
          y = 2;
        };
        dynamic_padding = false;
        opacity = 1.0;
      };
    };
  };

  home.file.".config/ghostty/config".text = ''
    theme = "GruvboxDarkHard"

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

  home.file.".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/macos-nix-config/home/zed_settings.json";
}
