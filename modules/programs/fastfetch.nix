{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "command-raw";
        source = "krabby random";
      };
    };
  };
}
