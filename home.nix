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

  programs    = {
    gh        = import ./home/gh.nix params;
    starship  = import ./home/starship.nix params;
    zoxide    = import ./home/zoxide.nix params;
    fzf       = import ./home/fzf.nix params;
    zsh       = import ./home/zsh.nix params;
    git       = import ./home/git.nix params;
    tmux      = import ./home/tmux.nix params;
    nixvim    = import ./home/nixvim.nix params;
    emacs     = {
      enable  = true;
      package = pkgs.emacs;
    };
  };

  home.packages = with pkgs; [
    lsd
    nixd
    alacritty
    kitty

    fastfetch

    clang-tools
    pkg-config

    jdk
    jre8
  ];
}
