# TODO: starship
# TODO: pnpm
# TODO: fzf
# TODO: zoxide

{ pkgs, ... }@params:
{
  home.username = "hesham";
  home.homeDirectory = "/home/hesham";
  home.sessionVariables = {
    EDITOR = "emacsclient -a 'doom run'";
  };

  programs.home-manager.enable = true;
  programs.gh = (import ./home/gh.nix) params;
  programs.starship = (import ./home/starship.nix) params;
  programs.zoxide = (import ./home/zoxide.nix) params;
  programs.fzf = (import ./home/fzf.nix) params;
  programs.zsh = (import ./home/zsh.nix) params;
  programs.git = (import ./home/git.nix) params;
  programs.neovim = (import ./home/neovim.nix) params;

  home.packages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.nixd
    pkgs.starship
  ];

  home.stateVersion = "25.05";
}
