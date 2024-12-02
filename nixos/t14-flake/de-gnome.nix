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
    style = "adwaita";
    platformTheme = "gnome";
  };


  environment.gnome.excludePackages = with pkgs; [ 

    gnome-tour 
    epiphany 
    pkgs.gnome-characters 
    pkgs.totem 
    pkgs.tali 
    pkgs.iagno 
    pkgs.hitori 
    pkgs.atomix 
    pkgs.geary 
    pkgs.gnome-software 
    orca

  ];

  environment.systemPackages = with pkgs; [
    pkgs.gnome-tweaks
    pkgs.gnome-session
    #gnomeExtensions.user-themes
    #gnomeExtensions.clipboard-indicator
    libsForQt5.qtstyleplugin-kvantum
    numlockx
    bibata-cursors
    papirus-icon-theme
    transmission_4-gtk
    copyq
    #gedit
   
  ];
  
}

