# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Enable the X11 windowing system.
  services = {

    desktopManager = {
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

  services.xserver.desktopManager.xterm.enable = false;
  environment.gnome.excludePackages = with pkgs; [

    gnome-tour
    epiphany
    gnome-software
    gnome-console
    gnome-characters
    totem
    tali
    iagno
    hitori
    atomix
    geary
    orca
    xterm

  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-session
    gnomeExtensions.user-themes
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.light-style
    kdePackages.qtstyleplugin-kvantum
    orchis-theme
    ostree
    appstream-glib
    numlockx
    bibata-cursors
    papirus-icon-theme
    transmission_4-gtk
    #copyq
    papers

  ];

}
