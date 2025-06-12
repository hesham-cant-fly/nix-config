{ ... }:
{
  programs.bash = {
    enable      = true;
    bashrcExtra =
      ''
        exec zsh
      '';
  };
}
