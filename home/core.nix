{ pkgs, ... }: {
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

    plugins = {
      treesitter.enable = true;
      lsp.enable = true;
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
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
  };

  programs.nix-index.enable = false;
  home.shellAliases = {
#    docker = "podman";
  };
}
