# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;  
      };
    };

    displayManager.lightdm.greeters = {
      gtk = {
        enable = true;
      };

      gtk.theme = {
        name = "Orchis-Green-Light-Compact";
      };

      gtk.iconTheme = {
        name = "Papirus-Light";
      };

      gtk.cursorTheme = {
        name = "Bibata-Modern-Amber";
      };
    };

    displayManager.lightdm.background = /home/reza/Pictures/a.jpg;
  };

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  services.blueman.enable = true;
  
  services.picom ={
    enable = true;
    backend = "glx";
    vSync = true;
    fade = true;
    fadeSteps = [ 0.03 0.02 ];
    fadeDelta = 5;
    shadow = true;
    shadowOffsets = [ (-8) (-8) ];
    wintypes = {
      "popup_menu" = { "opacity" = 0.9; };
      "normal" = { "blur-background" = true;};
    };

    settings = {
      shadow-radius = 8;
      shadow-red = 0;
      shadow-green = 71;
      shadow-blue = 234;
      shadow-exclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Cairo-clock'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      blur =
        { method = "dual-kawase";
          size = 10;
        };
    };

  };

  environment.variables.QT_STYLE_OVERRIDE = "kvantum";
  
  environment.systemPackages = with pkgs; [
    transmission
    pavucontrol
    bibata-cursors
    papirus-icon-theme
    qogir-theme
    orchis-theme
    libsForQt5.qtstyleplugin-kvantum
    xfce.mousepad
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin
    numlockx
    mate.engrampa
    evince
    simple-scan
    flameshot

  ];

  
}
