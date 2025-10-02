# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # List services that you want to enable:

  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # services.openssh.allowSFTP = true;
  programs.mosh.enable = true;

  programs.adb.enable = true;

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  services.fwupd.enable = true;
  services.colord.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
  };

  services.libinput.enable = true;

  zramSwap.enable = true;

  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
    krita
    efibootmgr
    mumble
    lazygit
    tlp
    devenv
    zathura

  ];

}
