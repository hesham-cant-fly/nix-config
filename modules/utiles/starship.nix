{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$character";
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      os = {
        disable = true;

        directory = {
          format = "[$path](fg:#AAAAAA) ";
          read_only = "  ";
          truncation_length = 4;
          truncation_symbol = "~/…/";
          truncate_to_repo = true;
        };

        directory.substitutions = {
          "Documents" = "";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
          "Videos" = "";
          "Projects" = "󱌢";
          "School" = "󰑴";
          "www" = "";
          ".config" = "";
          "dotfiles" = "";
        };
      };
    };
  };
}
