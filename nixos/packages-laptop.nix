# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      epson_201207w
      foomatic-filters
      gutenprint
      gutenprintBin
    ];
  };

  programs.droidcam.enable = true;
  
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
    ffmpeg
    unrar
    gimp
    calc
    youtube-dl
    ytmdl
    bash
    bashCompletion
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
    transmission-gtk
    virt-manager
    mumble
  ];

}
