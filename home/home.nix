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

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  # stylix.image = ../../assets/images/wall1.jpg;
  stylix.polarity = "dark";

  services.flameshot.enable = true;
  services.playerctld.enable = true;
  xserver.enable = true;

  home.packages = with pkgs; [
    lsd
    nixd
    alacritty

    fastfetch

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
