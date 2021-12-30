# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];

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


}

