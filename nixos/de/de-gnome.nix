# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

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
    xwayland.enable = true;
  };

  qt = {
    enable = true;
    style = "kvantum";
    #platformTheme = "gnome";
  };


  environment.gnome.excludePackages = with pkgs; [ 

    gnome-tour 
    epiphany 
    gnome-characters 
    totem 
    tali 
    iagno 
    hitori 
    atomix 
    geary 
    gnome-software 
    orca
    xterm

  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-session
    gnomeExtensions.user-themes
    gnomeExtensions.clipboard-indicator
    kdePackages.qtstyleplugin-kvantum
    orchis-theme
    ostree
    appstream-glib
    numlockx
    bibata-cursors
    papirus-icon-theme
    transmission_4-gtk
    #copyq
    ptyxis
    papers
   
  ];
  
}

