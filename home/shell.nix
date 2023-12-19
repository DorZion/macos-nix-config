{ pkgs, ... }: {
  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
          sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
        };
      }
      {
        name = "plugin-git";
        src = pkgs.fetchFromGitHub {
          owner = "jhillyerd";
          repo = "plugin-git";
          rev = "641b8722948bde5863cc3a049c2fde394158122d";
          hash = "sha256-pZY9gslSXbBhgrSCUAc+2jLSS674Db8jEH2iz/O2nVU=";
        };
      } 
      {
        name = "tide";
        src = pkgs.fetchFromGitHub {
          owner = "IlanCosman";
          repo = "tide";
          rev = "96635fbfd3448ca2a7bead773537e91e86913614";
          hash = "sha256-WA+4JOcbQncy52iSe7Tp4KeFbrQKV+5nFJYRoQbfsvs=";
        };
      }
    ];
    shellInit = ''
      fish_add_path /opt/homebrew/bin

      set -g fish_color_autosuggestion '555'  'brblack'
      set -g fish_color_cancel -r
      set -g fish_color_command --bold
      set -g fish_color_comment red
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_end brmagenta
      set -g fish_color_error brred
      set -g fish_color_escape 'bryellow'  '--bold'
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_match --background=brblue
      set -g fish_color_normal normal
      set -g fish_color_operator bryellow
      set -g fish_color_param cyan
      set -g fish_color_quote yellow
      set -g fish_color_redirection brblue
      set -g fish_color_search_match 'bryellow'  '--background=brblack'
      set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
      set -g fish_color_user brgreen
      set -g fish_color_valid_path --underline
    '';
  };
  programs.starship = {
    enable = false;
    settings = {
      time = {
        disabled = false;
      };
    };
  };
}
