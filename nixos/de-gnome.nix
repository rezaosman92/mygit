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
    evince.enable = true;
  };

  qt.style = "adwaita";
  qt.platformTheme = "gnome";
  
  environment.gnome.excludePackages = [ pkgs.epiphany pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour pkgs.gnome.geary pkgs.orca pkgs.gnome.gnome-software ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.gnome-session
    gnomeExtensions.user-themes
    libsForQt5.qtstyleplugin-kvantum
    numlockx
    orchis-theme
    qogir-theme
    bibata-cursors
    papirus-icon-theme
    transmission-gtk
  ];
  
}

