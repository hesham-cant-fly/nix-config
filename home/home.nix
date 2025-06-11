{ inputs, pkgs, ... }:
let
  nixvim = inputs.nixvim;
  ags    = inputs.ags;
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ags.homeManagerModules.default
    ../modules
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.username = "hesham";
  home.homeDirectory = "/home/hesham";
  home.sessionVariables = {
    EDITOR = "emacsclient -a 'doom run'";
    PATH = "$PATH:/home/hesham/.config/emacs/bin/:/home/hesham/.local/bin";
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

  # wayland.windowManager.sway = import ./window-manager/sway.nix params;

  # programs    = {
  #   gh        = import ./home/gh.nix       params;
  #   starship  = import ./home/starship.nix params;
  #   zoxide    = import ./home/zoxide.nix   params;
  #   fzf       = import ./home/fzf.nix      params;
  #   zsh       = import ./home/zsh.nix      params;
  #   git       = import ./home/git.nix      params;
  #   tmux      = import ./home/tmux.nix     params;
  #   nixvim    = import ./home/nixvim.nix   params;
  #   eww       = import ./home/eww.nix      params;
  #   ags       = import ./home/ags.nix      params;
  #   kitty     = import ./home/kitty.nix    params;
  #   btop      = import ./home/btop.nix     params;
  #   rofi      = import ./home/rofi.nix     params;
  #   bash      = import ./home/bash.nix     params;
  #   emacs     = {
  #     enable  = true;
  #     package = pkgs.emacs;
  #   };
  # };

  services.flameshot.enable = true;
  services.playerctld.enable = true;

  home.packages = with pkgs; [
    lsd
    nixd
    alacritty

    fastfetch

    clang-tools
    pkg-config

    jdk

    # Sway related stuff
    autotiling-rs
    swaybg
    swaynotificationcenter
  ];
}
