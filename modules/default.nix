{ pkgs, ... }:
{
  imports = [
    ./stylix.nix
    ./desktop-entries.nix
    ./terminal
    ./editors
    ./shells
    ./utiles
    ./programs
    ./wm
  ];
  programs    = {
    emacs     = {
      enable  = true;
      package = pkgs.emacs;
    };
  };
}
