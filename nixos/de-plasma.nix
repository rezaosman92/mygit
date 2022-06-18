# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nixpkgs.config = {                                                                                                                                               
    firefox.enablePlasmaBrowserIntegration = true;
  };
  
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
      theme = "materia-light";
    };
  };

  environment.systemPackages = with pkgs; [
    okular
    materia-kde-theme
    graphite-kde-theme
    breeze-gtk-theme
    materia-gtk-theme
    
  ];

}

