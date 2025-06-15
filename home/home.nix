{ inputs, system, pkgs, ... }:
let
  nixvim = inputs.nixvim;
  quickshell = inputs.quickshell;
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
    pandoc
    ed

    nodejs
    pnpm
    python314
    tree-sitter
    quickshell.packages.${system}.default
    kdePackages.qtdeclarative

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
