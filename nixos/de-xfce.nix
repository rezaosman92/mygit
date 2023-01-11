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
        name = "Orchis-Yellow-Dark-Compact";
      };

      gtk.iconTheme = {
        name = "Papirus";
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
