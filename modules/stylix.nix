{ pkgs, ... }:
{
  stylix = with pkgs; {
    enable = true;
    enableReleaseChecks = false;
    # base16Scheme = "${base16-schemes}/share/themes/onedark.yaml";
    base16Scheme = "${base16-schemes}/share/themes/gruvbox-dark.yaml";
    # base16Scheme = "${base16-schemes}/share/themes/moonlight.yaml";
    # image = /home/hesham/Downloads/wallhaven-7jgyre.jpg;
    # image = /home/hesham/Downloads/wallhaven-1q83qg.jpg;
    image = /home/hesham/Downloads/wallhaven-5yd6d5.png;
    # image = /home/hesham/Downloads/wallhaven-o5k7kl.jpg;
    # image = /home/hesham/Downloads/wallpaperflare.com_wallpaper.jpg;
    # image = /home/hesham/Downloads/wallpaperflare.com_wallpaper-gjwku.jpg;
    # image = /home/hesham/Downloads/wallpaperflare.com_wallpaper-mountains.jpg;
    # image = /home/hesham/Downloads/wallpaperflare.com_wallpaper-cool-sunset.jpg;
    polarity = "dark";

    cursor.package = bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
    cursor.size = 30;

    opacity = {
      applications = 1.0;
      terminal = 0.7;
      desktop = 1.0;
      popups = 1.0;
    };

    fonts = with pkgs; {
      monospace = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        applications = 10;
        terminal = 16;
        desktop = 10;
        popups = 10;
      };
    };
  };
}
