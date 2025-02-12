{pkgs, ...}: let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "cc8e4d8fffbdaab07b3979131030b234596f18da";
    hash = "sha256-udiU2TOh0lYL7K7ylbt+BGlSDgCjMpy75vQ98C1kFcc=";
  };
in {
  #home.file.".config/fish/themes/Catppuccin Mocha.theme".source = "${catppuccin-fish}/themes/Catppuccin Mocha.theme";
  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fetchFromGitHub {
          owner = "jhillyerd";
          repo = "plugin-git";
          rev = "6336017c16c02b1e9e708dd4eb233e66a18b62fe";
          hash = "sha256-DQLRat7uGoK57g/1x9Y514gtjvDdf9j4Iqnwif8QWVU=";
        };
      }
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
          hash = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
        };
      }
    ];
    shellInit = ''
      set fish_greeting

      fish_add_path /opt/homebrew/bin
      fish_add_path ~/.local/bin

      source ${pkgs.asdf-vm}/share/asdf-vm/asdf.fish
      ${pkgs.direnv}/bin/direnv hook fish | source

      if test -d (brew --prefix)"/share/fish/completions"
          set -p fish_complete_path (brew --prefix)/share/fish/completions
      end

      if test -d (brew --prefix)"/share/fish/vendor_completions.d"
          set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
      end

      # set -g fish_color_autosuggestion '555'  'brblack'
      # set -g fish_color_cancel -r
      # set -g fish_color_command --bold
      # set -g fish_color_comment red
      # set -g fish_color_cwd green
      # set -g fish_color_cwd_root red
      # set -g fish_color_end brmagenta
      # set -g fish_color_error brred
      # set -g fish_color_escape 'bryellow'  '--bold'
      # set -g fish_color_history_current --bold
      # set -g fish_color_host normal
      # set -g fish_color_match --background=brblue
      # set -g fish_color_normal normal
      # set -g fish_color_operator bryellow
      # set -g fish_color_param cyan
      # set -g fish_color_quote yellow
      # set -g fish_color_redirection brblue
      # set -g fish_color_search_match 'bryellow'  '--background=brblack'
      # set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
      # set -g fish_color_user brgreen
      # set -g fish_color_valid_path --underline
    '';
    shellAliases = {
      vim = "nvim";
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = false;
      package.disabled = true;
      docker_context.disabled = true;

      time = {
        disabled = true;
      };

      # Catppuccin_mocha
      palette = "catppuccin_mocha";

      git_branch = {
        style = "bold mauve";
      };

      directory = {
        #truncation_length = 4;
        style = "bold lavender";
        fish_style_pwd_dir_length = 1;
      };

      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](subtext1)";
      };

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
