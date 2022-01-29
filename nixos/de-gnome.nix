# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager = {
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

  qt5.style = "adwaita-dark";
  virtualisation.waydroid.enable = true;
  
  environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome-photos pkgs.epiphany pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour pkgs.gnome.geary pkgs.gnome.orca ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.clipboard-indicator
  ];
  
}

