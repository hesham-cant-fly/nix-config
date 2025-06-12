{ ... }:
{
  xdg.desktopEntries = {
    doom-emacs = {
      name = "Doom Emacs";
      genericName = "Text Editor";
      exec = "/home/hesham/.config/emacs/bin/doom run";
      icon = "emacs";
      terminal = false;
    };
  };
}
