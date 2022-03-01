# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aria2
    htop
    neofetch
    gcc
    usbutils
    autoPatchelfHook
    brave
    firefox
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
  ];

}

