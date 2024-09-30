# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  hardware.pulseaudio.enable = false;
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      gnome = {
        enable = true;
      };
    };
    displayManager.gdm = {
      enable = true;
    };
  };

  services.gvfs.enable = true;
  
  programs = {
    evince.enable = true;
    xwayland.enable = true;
  };

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };


  environment.gnome.excludePackages = with pkgs; [ 
  
    epiphany 
    gnome.gnome-characters 
    gnome.totem 
    gnome.tali 
    gnome.iagno 
    gnome.hitori 
    gnome.atomix 
    gnome-tour 
    gnome.geary 
    orca 
    gnome.gnome-software 

  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-session
    #gnomeExtensions.user-themes
    #gnomeExtensions.clipboard-indicator
    libsForQt5.qtstyleplugin-kvantum
    numlockx
    bibata-cursors
    papirus-icon-theme
    transmission-gtk
    copyq
    #gedit
   
  ];
  
}

