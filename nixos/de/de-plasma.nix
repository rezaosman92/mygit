# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{


  services = {
    xserver = {
      enable = true; 
      };

       displayManager.sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
        
        theme = "breeze";
      };
    
    desktopManager = {
      plasma6 = {
        enable = true;
      };
  
    };

  };

    

  programs.dconf.enable = true;
  
  environment.systemPackages = with pkgs; [
    okular
    transmission_4-qt
    papirus-icon-theme
    #kdePackages.plasma-integration
  ];


  environment.plasma6.excludePackages = with pkgs.kdePackages; [

    oxygen
  
   ];

  
}
