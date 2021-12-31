# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, ... }:

{

    
  # Enable driver for amd cards, polaris and above
  services.xserver = {
    videoDrivers = ["amdgpu"];
  };


}

