# TODO: starship
# TODO: pnpm
# TODO: fzf
# TODO: zoxide

{ inputs, pkgs, ... }@params:
let
  nixvim = inputs.nixvim;
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.username = "hesham";
  home.homeDirectory = "/home/hesham";
  home.sessionVariables = {
    EDITOR = "emacsclient -a 'doom run'";
    PATH = "$PATH:~/.config/emacs/bin";
  };

  xdg.desktopEntries = {
    doom-emacs = {
      name = "Doom Emacs";
      genericName = "Text Editor";
      exec = "/home/hesham/.config/emacs/bin/doom run";
      icon = "emacs";
      terminal = false;
    };
  };

  programs.gh = import ./home/gh.nix params;
  programs.starship = import ./home/starship.nix params;
  programs.zoxide = import ./home/zoxide.nix params;
  programs.fzf = import ./home/fzf.nix params;
  programs.zsh = import ./home/zsh.nix params;
  programs.git = import ./home/git.nix params;
  programs.tmux = import ./home/tmux.nix params;
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
    };

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
        };
      };
    };
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.packages = with pkgs; [
    lsd
    nixd
    alacritty
    kitty

    fastfetch

    clang-tools
  ];
}
