# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./de-xfce.nix
      ./filesystem.nix
      ./xorg-intel.nix
      ./packages-t14.nix
      ./printer.nix
      #./scanner.nix
    ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  zramSwap.enable = true;

  services.fwupd.enable = true;
  services.colord.enable = true;


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_6_6;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [ "acpi_backlight=native" ];

  networking.hostName = "nixos-x230"; 
  networking.networkmanager.enable = true;
 #networking.wireguard.enable = true;

# Set your time zone.
  time.timeZone = "Asia/Jakarta";


# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "id_ID.UTF-8/UTF-8"
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
#   useXkbConfig = true; # use xkbOptions in tty.
  };

  hardware.bluetooth.enable = true;

  xdg.portal = {
    enable = true;
  };

    
  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

#  services.fstrim.enable = true;

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  services.xserver.libinput.enable = true;

  users.users.reza = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "libvirtd" "scanner" "lp" "vboxusers" ];
    description = "Reza Maulana";
  };


  programs.fish = {
    enable = true;  
  };

  programs.tmux.enable = true;

  #programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = pkgs.emacs-nox;
  };

  services.flatpak.enable = true;

  
  users.defaultUserShell = pkgs.fish;

  nixpkgs.config = {
    allowUnfree = true;
    };

  nix.settings.auto-optimise-store = true;
  
  nix.extraOptions = ''
  experimental-features = nix-command flakes
                   '';

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment = {
    shellAliases = {
      "ec" = "emacsclient -t";
      "most" = "most -w";
    };
  
    variables = {
      PAGER = "most -w";

    };

  };
    
  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts
    hack-font
  ];

  programs.adb.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.allowSFTP = true;
  programs.mosh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

