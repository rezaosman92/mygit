# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

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
    gcc
    usbutils
    autoPatchelfHook
    brave
    tor-browser-bundle-bin
    ffmpeg
    unrar
    gimp
    calc
    yt-dlp
    ytmdl
    bash
    bash-completion
    bashInteractive
    mpv
    p7zip
    most
    curl
    gnumake
    perl
    wget
    puddletag
    cmus
    git
    copyq
    nload
    mumble
    virt-manager
    mumble
    wezterm
    helix
    lutris
    recoll
  ];

}
