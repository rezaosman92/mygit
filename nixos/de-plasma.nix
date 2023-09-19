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

  programs.dconf.enable = true;
  
  environment.systemPackages = with pkgs; [
    okular
    libsForQt5.breeze-gtk
    libsForQt5.kde-gtk-config
    transmission-qt
    kate
  ];

  environment.plasma5.excludePackages = with pkgs; [

  ];
  
}
