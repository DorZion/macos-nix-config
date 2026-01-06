{pkgs, ...}: {
  home.shell.enableFishIntegration = true;

  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };

  catppuccin = {
    enable = false;
    flavor = "mocha";
  };

  programs.atuin.enable = false;

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "fzf.fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "gruvbox";
        src = pkgs.fishPlugins.gruvbox.src;
      }
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "foreign-env";
        src = pkgs.fishPlugins.foreign-env.src;
      }
      {
        name = "async-prompt";
        src = pkgs.fishPlugins.async-prompt.src;
      }
      # {
      #   name = "hydro";
      #   src = pkgs.fishPlugins.hydro.src;
      # }
      # {
      #   name = "tide";
      #   src = pkgs.fishPlugins.tide.src;
      # }
      {
        name = "pure";
        src = pkgs.fishPlugins.pure.src;
      }
    ];
    shellInit = ''
      set fish_greeting
      set fish_cursor_default block

      # fish_config prompt choose "informative_vcs"

      # fish_config prompt choose "scales"

      #theme_gruvbox dark hard

      fish_add_path /opt/homebrew/bin
      fish_add_path ~/.local/bin

      #source ${pkgs.asdf-vm}/share/asdf-vm/asdf.fish
      #${pkgs.direnv}/bin/direnv hook fish | source

      if test -d (brew --prefix)"/share/fish/completions"
          set -p fish_complete_path (brew --prefix)/share/fish/completions
      end

      if test -d (brew --prefix)"/share/fish/vendor_completions.d"
          set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
      end

      $HOME/.local/bin/mise activate fish | source

      fish_config theme choose "ayu Dark"

      # Pure
      set -g async_prompt_functions _pure_prompt_git
      set --universal pure_check_for_new_release false
      set --universal pure_shorten_prompt_current_directory_length 1
      set --universal pure_begin_prompt_with_current_directory false
      set --universal pure_enable_single_line_prompt true
      set --universal pure_show_subsecond_command_duration true

      #fish_config theme choose "fish default"
      
      #fish_config theme choose "nord"

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
      k = "kubectl";
    };
  };
  programs.starship = {
    enable = false;
    settings = {
      add_newline = false;
      line_break.disabled = false;
      package.disabled = true;
      docker_context.disabled = true;

      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$python$character";

      time = {
        disabled = true;
      };

      # Catppuccin_mocha
      #palette = "catppuccin_mocha";

      git_branch = {
        format = "[$branch]($style)";
        style = "mauve";
      };

      directory = {
        #truncation_length = 4;
        #style = "bold lavender";
        fish_style_pwd_dir_length = 1;
        style = "blue";
      };

      battery = {
        full_symbol = "• ";
        charging_symbol = "⇡ ";
        discharging_symbol = "⇣ ";
        unknown_symbol = "❓ ";
        empty_symbol = "❗ ";
      };

      nodejs = {
        symbol = "[⬢](bold green) ";
      };

      #character = {
      #  success_symbol = "[❯](green)";
      #  error_symbol = "[❯](red)";
      #  vimcmd_symbol = "[❮](subtext1)";
      #};
      character = {
        success_symbol = "[$exit\\$](green)";
        error_symbol = "[$exit\\$](red)";
        vimcmd_symbol = "[$exit\\❮](subtext1)";
      };
    };
  };
}
