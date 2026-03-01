{pkgs, ...}: {
  programs.vim = {
    enable = false;
    defaultEditor = false;
    #vimAlias = true;
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    colorscheme = "gruvbox";

    opts = {
      compatible = false;

      number = true;
      relativenumber = true;

      cursorline = true;
      lazyredraw = true;
      showmatch = true;
      incsearch = true;
      hlsearch = true;

      spell = true;
      spelllang = "en";

      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      foldenable = true;
      history = 2000;
      nrformats = "bin,hex"; # 'octal'
      undofile = true;
      splitright = true;
      splitbelow = true;
      cmdheight = 0;
    };

    globals = {
      mapleader = "<Space>";
      maplocalleader = "\\";
    };

    keymaps = [
      {
        mode = "n";
        key = "<localleader>cv";
        action = "<cmd>Octo review thread<CR>";
        options = { 
          desc = "View thread on line";
        };
      }
      {
        mode = "n";
        key = "<localleader>cV";
        action = "<cmd>Octo review comments<CR>";
        options = { 
          desc = "View all comments in the active review";
        };
      }
    ];

    plugins = {
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          gopls.enable = true;
          graphql.enable = true;
          ts_ls.enable = true;
        };
      };
      telescope.enable = true;
      which-key.enable = true;
      web-devicons.enable = true;
      mini.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
      };
      lint = {
        enable = true;
        lintersByFt = {
          nix = ["nix"];
        };
      };
      plenary.enable = true;
      fugitive.enable = true;
      blink-emoji.enable = true;
      blink-cmp-git.enable = true;
      bufferline.enable = true;

      octo = {
        enable = true;
        settings = {
          reviews = {
            auto_show_threads = false;
          };
        };
      };

      blink-cmp = {
        enable = true;
        settings.sources.providers = {
          emoji = {
            module = "blink-emoji";
            name = "Emoji";
            score_offset = 15;
            opts = {
              insert = true;
            };
          };
          git = {
            module = "blink-cmp-git";
            name = "git";
            score_offset = 100;
            opts = {
              commit = { };
              git_centers = { git_hub = { }; };
            };
          };
        };
      };
      settings.sources.default = [
        "lsp"
        "path" 
        "snippets"
        "buffer"
        "emoji"
        "git"
      ];
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      plenary-nvim
      oceanic-next
      (pkgs.vimUtils.buildVimPlugin {
        name = "gruvbox";
        src = pkgs.fetchFromGitHub {
            owner = "ellisonleao";
            repo = "gruvbox.nvim";
            rev = "a472496e1a4465a2dd574389dcf6cdb29af9bf1b";
            hash = "sha256-dotM6G4JG1dC9/JwHDR+lg4bMv7zPVI9MgEqCgCGECQ=";
        };
      })
    ];

    colorschemes.catppuccin = {
      enable = false;
      settings.flavour = "mocha";
    };
    colorschemes.gruvbox = {
      enable = false;
      settings = {
        contrast = "hard";
      };
    };
    colorschemes.ayu = {
      enable = false;
    };
    colorschemes.monokai-pro = {
      enable = false;
    };
    colorschemes.nord = {
      enable = false;
    };
    colorschemes.github-theme = {
      enable = false;
    };
  };

  programs.nix-index.enable = false;
  home.shellAliases = {
    #    docker = "podman";
  };
}
