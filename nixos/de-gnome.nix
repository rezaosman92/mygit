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

  programs = {
    evince.enable = true;
  };

  qt.style = "adwaita";
  
  environment.gnome.excludePackages = [ pkgs.epiphany pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour pkgs.gnome.geary pkgs.orca pkgs.gnome.gnome-software ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    numlockx
  ];
  
}

