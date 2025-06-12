{ pkgs, ... }:
{
  imports = [
    ./stylix.nix
    ./terminal
    ./editors
    ./shells
    ./utiles
    ./wm
  ];
  programs    = {
    # gh        = import ./gh.nix       params;
    # starship  = import ./starship.nix params;
    # zoxide    = import ./zoxide.nix   params;
    # fzf       = import ./fzf.nix      params;
    # zsh       = import ./zsh.nix      params;
    # git       = import ./git.nix      params;
    # tmux      = import ./tmux.nix     params;
    # nixvim    = import ./nixvim.nix   params;
    # eww       = import ./eww.nix      params;
    # ags       = import ./ags.nix      params;
    # kitty     = import ./kitty.nix    params;
    # btop      = import ./btop.nix     params;
    # rofi      = import ./rofi.nix     params;
    # bash      = import ./bash.nix     params;
    emacs     = {
      enable  = true;
      package = pkgs.emacs;
    };
  };
}
