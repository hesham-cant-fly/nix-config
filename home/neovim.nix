{ pkgs, ... }:
{
  enable = true;
  defaultEditor = false;

  extraPackages = [
    pkgs.vimPlugins.gruvbox-nvim
  ];
}
