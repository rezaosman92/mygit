# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  #nixpkgs.config = {                                                                                                                                               
  #  firefox.enablePlasmaBrowserIntegration = true;
  #};
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager = {
      plasma5 = {
        enable = true;
        runUsingSystemd = true;
      };
    };
    displayManager.sddm = {
      enable = true;
      theme = "breeze";
    };
  };

  environment.systemPackages = with pkgs; [
    okular
    graphite-kde-theme
    materia-kde-theme
    graphite-gtk-theme
    breeze-gtk
    papirus-icon-theme
    kate
    transmission-qt
  ];

  environment.plasma5.excludePackages = with pkgs; [

  ]
  
}
