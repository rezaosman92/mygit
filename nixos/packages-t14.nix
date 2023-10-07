# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

#let
#  unstable = import <nixos-unstable>
#    {
#      config =
#        {
#          allowUnfree = true;
#        };
#    };
#in

{

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

    environment.systemPackages = with pkgs; [
    acpi
    tlp
    aria2
    htop
    neofetch
    usbutils
    brave
    ffmpeg
    unrar
    calc
    yt-dlp
    bash
    bash-completion
    bashInteractive
    mpv
    p7zip
    most
    curl
    wget
    puddletag
    cmus
    git
    copyq
    nload
    lutris
    cloudflare-warp
    wireguard-tools
    nmap
    ghostscript
    python3
    pdfarranger
    woeusb-ng
    fzf
    lm_sensors
    audacity
    pciutils
    orchis-theme
    papirus-icon-theme
    sysbench

    ];
    
 
}
