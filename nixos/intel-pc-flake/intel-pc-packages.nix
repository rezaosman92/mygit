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
    btop
    fastfetch
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
    nload
    nmap
    pdfarranger
    woeusb-ng
    fzf
    lynis
    lm_sensors
    python3
    audacity
    pciutils
    sysbench
    libreoffice
    obs-studio
    vulkan-tools
    firefox
    #cloudflare-warp
    krita
    efibootmgr
    mumble
    lazygit


    #helix and its lsp
    helix
    nil
    lldb
    #nodePackages.bash-language-server


    #learn rust
    #clang
    #llvmPackages.bintools
    #rustup    
    #cargo
    #rustc
    #rust-analyzer
    #rustfmt


  ];


}
  
