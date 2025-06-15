{ pkgs, ... }:
let
  mod = "Mod4";
  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";
  editor = "emacsclient -a \"/home/hesham/.config/emacs/bin/doom run\" -c";

  terminal = "kitty";
  browser = "firefox";
in {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    wrapperFeatures = {
      gtk = true;
      base = true;
    };
    extraConfig =
      /* qmljs */''
        corner_radius 12

        # Blur Stuff
        blur enable
        blur_radius 3

        # Shadow
        shadows enable
        shadow_blur_radius 55
        shadow_color #1111117F
      '';
    config = {
      modifier = mod;
      bindkeysToCode = true;
      defaultWorkspace = "workspace number ${ws1}";
      window.border = 3;
      window.titlebar = false;
      gaps.inner = 13;
      bars = [
      ];
      assigns = {
        "workspace number ${ws1}" = [{ app_id = "firefox"; }];
        "workspace number ${ws3}" = [{ class = "Emacs"; }];
        "workspace number ${ws2}" = [
          { app_id = "com.rtosta.zapzap"; }
          { app_id = "org.telegram.desktop"; }
          { class = "vesktop"; }
        ];
      };
      startup = [
        # Backends/Daemons
        { command = "waybar"; }
        { command = "swaync"; }

        # { command = "--no-startup-id swaybg --image \"${background}\" --mode \"fit\""; }
        { command = "--no-startup-id autotiling-rs -w 5 6 7 8 9 10"; }
        { command = "--no-startup-id /home/hesham/.config/emacs/bin/doom run --daemon"; }
        { command = "--no-startup-id swaymsg \"workspace ${ws2}; layout tabbed\""; }

        # Start Up Programs
        { command = "${browser}"; }
        { command = "${editor}"; }
        { command = "flatpak run dev.vencord.Vesktop"; }
        { command = "flatpak run com.rtosta.zapzap"; }
        { command = "flatpak run org.telegram.desktop"; }
      ];
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
          dwtp = "enabled";
          tap_button_map = "lrm";
        };
        "*" = {
          xkb_layout = "fr,ara";
          xkb_variant = "azerty,";
          xkb_options = "grp:win_space_toggle";
        };
      };
      keybindings = {
        "${mod}+c" = "kill";
        "${mod}+Shift+r" = "reload";

        "${mod}+q" = "exec ${terminal}";
        "${mod}+b" = "exec ${browser}";
        "${mod}+r" = "exec rofi -show drun";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'Do you really want to exit sway?' -b 'Yes' 'swaymsg exit'";
        "${mod}+Shift+n" = "exec swaync-client -t -sw";

        "${mod}+m" = "exec ${editor}";
        "${mod}+Shift+space" = "focus parent";

        # Layouts
        "${mod}+f" = "fullscreen toggle";

        "${mod}+g" = "layout toggle split";
        "${mod}+v" = "floating toggle";

        "${mod}+t" = "layout tabbed";
        "${mod}+z" = "layout stacking";

        # Workspaces
        "${mod}+Shift+s" = "move scratchpad";
        "${mod}+s" = "scratchpad show";

        # Movement
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+Left"  = "focus left";
        "${mod}+Down"  = "focus down";
        "${mod}+Up"    = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+Left"  = "move left";
        "${mod}+Shift+Down"  = "move down";
        "${mod}+Shift+Up"    = "move up";
        "${mod}+Shift+Right" = "move right";

        # Multimedia
        ## Volume
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%"; # increase sound volume
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%"; # decrease sound volume
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle"; # mute sound

        ## Sreen brightness controls
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set 10%+"; # increase screen brightness
        "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 10%-"; # decrease screen brightness

        ## Media player controls
        "XF86AudioPlay" = "exec --no-startup-id playerctl play";
        "XF86AudioPause" = "exec --no-startup-id playerctl pause";
        "XF86AudioNext" = "exec --no-startup-id playerctl next";
        "XF86AudioPrev" = "exec --no-startup-id playerctl previous";

        ## Screen Shot
        "Print" = "exec flameshot gui";

        # switch to workspace (AZERTY)
        "${mod}+ampersand" = "workspace number ${ws1}";
        "${mod}+eacute" = "workspace number ${ws2}";
        "${mod}+quotedbl" = "workspace number ${ws3}";
        "${mod}+apostrophe" = "workspace number ${ws4}";
        "${mod}+parenleft" = "workspace number ${ws5}";
        "${mod}+minus" = "workspace number ${ws6}";
        "${mod}+egrave" = "workspace number ${ws7}";
        "${mod}+underscore" = "workspace number ${ws8}";
        "${mod}+ccedilla" = "workspace number ${ws9}";
        "${mod}+agrave" = "workspace number ${ws10}";

        # move focused container to workspace (AZERTY)
        "${mod}+1" = "move container to workspace number ${ws1}";
        "${mod}+2" = "move container to workspace number ${ws2}";
        "${mod}+3" = "move container to workspace number ${ws3}";
        "${mod}+4" = "move container to workspace number ${ws4}";
        "${mod}+5" = "move container to workspace number ${ws5}";
        "${mod}+6" = "move container to workspace number ${ws6}";
        "${mod}+7" = "move container to workspace number ${ws7}";
        "${mod}+8" = "move container to workspace number ${ws8}";
        "${mod}+9" = "move container to workspace number ${ws9}";
        "${mod}+0" = "move container to workspace number ${ws10}";
      };
    };
  };
}
