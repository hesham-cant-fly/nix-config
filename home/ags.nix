{ pkgs, ... }:
{
  enable = true;

  extraPackages = with pkgs; [
    gtksourceview
    webkitgtk
    accountsservice
  ];
}
