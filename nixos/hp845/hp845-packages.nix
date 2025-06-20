# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    bottles
    btop
    fastfetch
    usbutils
    brave
    ffmpeg-full
    unrar
    calc
    yt-dlp
    bash
    bash-completion
    bashInteractive
    mpv
    _7zz
    most
    curl
    aria2
    puddletag
    cmus
    git
    nload
    nmap
    pdfarranger
    woeusb-ng
    lynis
    lm_sensors
    audacity
    pciutils
    sysbench
    libreoffice
    # obs-studio
    firefox
    gimp
    efibootmgr
    mumble
    lazygit
    tlp
    devenv


  ];


}
  
