{ inputs, pkgs, ... }:
let
  nixvim = inputs.nixvim;
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ../modules
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  qt.enable = true;

  home.username = "hesham";
  home.homeDirectory = "/home/hesham";
  home.sessionVariables = {
    EDITOR = "emacsclient -a 'doom run'";
    PATH = "$PATH:/home/hesham/.config/emacs/bin/:/home/hesham/.local/bin";
  };

  services.flameshot.enable = true;
  services.playerctld.enable = true;

  home.packages = with pkgs; [
    nodejs
    pnpm
    python314
    # python314Packages.pip
    tree-sitter
    # fd

    lsd
    nixd
    alacritty
    alarm-clock-applet

    nitch
    krabby

    clang-tools
    pkg-config

    jdk

    pavucontrol

    # Sway related stuff
    autotiling-rs
    swaybg
    swaynotificationcenter
  ];
}
