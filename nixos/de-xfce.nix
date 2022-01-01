# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
    desktopManager = {
      xfce = {
        enable = true;  
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };
    };
    
    displayManager.lightdm.greeters = {
      gtk = {
        enable = true;
      };

      gtk.theme = {
        name = "Materia-light";  
      };

      gtk.iconTheme = {
        name = "Papirus-light";
      };

      gtk.cursorTheme = {
        name = "capitaine-light";
      };
    };

    displayManager.lightdm.background = /home/reza/Pictures/a.jpg;
  };

  services.picom ={
    enable = true;
    backend = "glx";
    vSync = true;
    fade = true;
    fadeDelta = 5;
    experimentalBackends = true;
    shadow = true;
    shadowOffsets = [ (-8) (-8) ];
    wintypes = { "popup_menu" =
      { "opacity" = 0.9; };
               };

    settings = {
      shadow-radius = 8;
      shadow-red = 0;
      shadow-green = 255;
      shadow-blue = 217;
      shadow-exclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

    };
  };

environment.systemPackages = with pkgs; [
    lightlocker
    pavucontrol
    capitaine-cursors
    papirus-icon-theme
    materia-theme
    libsForQt5.qtstyleplugin-kvantum
    xfce.mousepad
    xfce.xfce4-whiskermenu-plugin
    numlockx
    gnome.file-roller
    evince
    flameshot
  ];

  
}

