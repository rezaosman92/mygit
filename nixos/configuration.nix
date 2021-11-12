# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  zramSwap.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.interfaces.wlp0s20u3.useDHCP = true;
  networking = {
    networkmanager.dns = "systemd-resolved";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    fallbackDns = ["1.1.1.1" "1.0.0.1"];
    extraConfig = "
                  DNSOverTLS=yes
                  ";
  };
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    #windowManager.dwm.enable = true;
    videoDrivers = ["amdgpu"];

    desktopManager = {
      xfce = {
        enable = true;  
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };

    };
    displayManager.lightdm.greeters = {
      gtk = {
        enable = true;
      };

      gtk.theme = {
        name = "Orchis-dark-compact";  
      };

      gtk.iconTheme = {
        name = "Qogir-dark";
      };

      gtk.cursorTheme = {
        name = "Qogir-dark";
      };
    };
    displayManager.lightdm.background = /home/reza/Pictures/a.jpg;

  };

  services.picom ={
    enable = true;
    backend = "glx";
    vSync = true;
    fade = true;
    fadeDelta = 5;
    experimentalBackends = true;
    shadow = true;
    shadowOffsets = [ (-8) (-8) ];
    wintypes = { "popup_menu" =
      { "opacity" = 0.9; };
               };

    settings = {
      shadow-radius = 8;
      shadow-red = 0;
      shadow-green = 255;
      shadow-blue = 217;
      shadow-exclude = [
        "name = 'Notification'"
          "class_g = 'Conky'"
          "class_g ?= 'Notify-osd'"
          "class_g = 'Cairo-clock'"
          "_GTK_FRAME_EXTENTS@:c"
      ];

    };
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = pkgs.emacs-nox;
  };

  # sound.mediaKeys.enable = true;

  #  services.dwm-status = {
  #         enable = true;
  #         order = ["network" "audio" "time"];
  #  };


  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable sound.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };  

  services.fstrim.enable = true;
  services.gvfs.enable = true;

  services.earlyoom = {
    enable = true;
    enableDebugInfo = true;
    enableNotifications = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.reza = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" ]; # Enable ‘sudo’ for the user.
    description = "Reza Maulana";
  };

  users.defaultUserShell = pkgs.fish;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.config = {
    allowUnfree = true;
    };

  environment.systemPackages = with pkgs; [
    aria2
    htop
    orchis
    neofetch
    gcc
    usbutils
    autoPatchelfHook
    firefox-bin
    ostree
    unrar
    evince
    gimp
    calc
    youtube-dl
    patchelf
    bash
    bashCompletion
    bashInteractive
    mpv
    p7zip
    most
    mate.engrampa
    curl
    pavucontrol
    dpkg
    gnumake
    perl
    perlPackages.WWWMechanize
    perlPackages.IOHTML
    perlPackages.LWPProtocolHttps
    wget
    puddletag
    lightlocker
    cmus
    xfce.gigolo
    python3
    lutris
    capitaine-cursors
    git
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    copyq
    flameshot
    papirus-icon-theme
    materia-theme
    qogir-icon-theme
    numlockx
    thunderbird-bin
    alacritty
    recoll
    nload
    dbeaver
  ];

  environment = {
    shellAliases = {
      "ec" = "emacsclient -t";
      "most" = "most -w";
    };
  
    variables = {
      PAGER = "most -w";
    };
    
  };
    
  fonts.fonts = with pkgs; [
    source-code-pro
    liberation_ttf
    terminus_font
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  #programs.neovim = {
  #       enable = true;
  #   defaultEditor = false;
  #       vimAlias = true;
  #   viAlias = true;
  #   configure = {
  #               customRC = ''
  #                       set number
  #       filetype plugin on
  #       syntax on
  #               '';  
  #   };
  #};
  
  programs.tmux = {
    enable = true;
    historyLimit = 10000;
    clock24 = true;
    baseIndex = 1;
  };

  programs.fish = {
    enable = true;  
  };
  
  programs.qt5ct.enable = true;
  programs.adb.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.openjdk11;
  };

  appstream.enable = true;
  
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

#filesystem
fileSystems."/" =
  { 
    fsType = "btrfs";
    options = ["subvol=@" "noatime" "compress=zstd:3" "space_cache=v2"];
  };

fileSystems."/home" =
  { 
    fsType = "btrfs";
    options = ["subvol=@home" "noatime" "compress=zstd:3" "space_cache=v2"];
  };

fileSystems."/var/log" =
  { 
    fsType = "btrfs";
    options = ["subvol=@var_log" "noatime" "compress=zstd:3" "space_cache=v2"];
  };

  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?


}

