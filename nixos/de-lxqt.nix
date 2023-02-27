# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
    desktopManager = {
      xterm.enable = false;
      lxqt.enable = true;
    };
  };

    environment.variables.QT_STYLE_OVERRIDE = "kvantum";
  
  environment.systemPackages = with pkgs; [
    kwin
    libsForQt5.plasma-settings
    lxqt.pavucontrol-qt
    bibata-cursors
    papirus-icon-theme
    libsForQt5.qtstyleplugin-kvantum
    numlockx
    okular
    flameshot
  ];

  
}

