 # Edit this configuration file to define what should be installed on
 # your system.  Help is available in the configuration.nix(5) man page
 # and in the NixOS manual (accessible by running ‘nixos-help’).
 
 { config, pkgs, ... }:
 
 { 
 imports =
 [ # Include the results of the hardware scan.
 <nixos-hardware/lenovo/thinkpad/x230>
 ./hardware-configuration.nix
 ];
 
 # Use the systemd-boot EFI boot loader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;
 boot.initrd.kernelModules = [ "acpi_call" ];
 
 # Networking with networkmanager
 networking.hostName = "nix"; # Define your hostname.
 networking.networkmanager.enable = true;
 
 # The global useDHCP flag is deprecated, therefore explicitly set to false here.
 # Per-interface useDHCP will be mandatory in the future, so this generated config
 # replicates the default behaviour.
 networking.useDHCP = false;
 networking.interfaces.enp0s25.useDHCP = true;
 networking.interfaces.enp0s26u1u2.useDHCP = true;
 networking.interfaces.wlp3s0.useDHCP = true;
 
 # Configure network proxy if necessary
 # networking.proxy.default = "http://user:password@proxy:port/";
 # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
 
 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";
 console = {
   font = "Lat2-Terminus16";
   keyMap = "us";
 };
 
 # Set your time zone.
 time.timeZone = "Asia/Jakarta";
 
 # List packages installed in system profile. To search, run:
 # $ nix search wget
 nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
 neovim
 zathura
 sxiv
 emacs-nox
 firefox
 usbutils
 pciutils
 ntfs3g
 linuxPackages_latest.acpi_call
 gimp
 numix-sx-gtk-theme
 numix-solarized-gtk-theme
 canta-theme
 mpv
 dbeaver
 recoll
 gvfs
 picom
 alacritty
 git
 neofetch
 htop
 p7zip
 aria2
 bash
 bash-completion
 youtube-dl
 qogir-icon-theme
 acpi
 xfce.xfce4-whiskermenu-plugin
 xfce.xfce4-battery-plugin
 xfce.tumbler
 xfce.xfce4_clipman_plugin
 lm_sensors
 anydesk
 zoom-us
 linuxPackages.acpi_call
 tpacpi-bat
 libreoffice-fresh
 numix-gtk-theme
 numix-cursor-theme
 ];
 
 # virtualization
 virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
 };
 
 virtualisation.virtualbox.guest.enable = true;
 
 # Some programs need SUID wrappers, can be configured further or are
 # started in user sessions.
 # programs.mtr.enable = true;
 programs.gnupg.agent           = {
               enable           = true;
               enableSSHSupport = true;
               pinentryFlavor   = "gnome3";
 };
 
 # List services that you want to enable:
 
 # Enable the OpenSSH daemon.
 services.openssh.enable = true;
 
 # Firewall with nftables
 networking.firewall.enable  = false;
                             networking.nftables = {
                             enable = true;
                             ruleset = "

                             flush ruleset
                             table inet my_table {
                             chain my_input {
                             type filter hook input priority 0; policy drop;
                             
                             iif lo accept 
                             ct state invalid drop 
                             ct state established,related accept 
                             
                             meta l4proto ipv6-icmp icmpv6 type { destination-unreachable, packet-too-big, time-exceeded, parameter-problem, mld-listener-query, mld-listener-report, mld-listener-reduction, nd-router-solicit, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert, ind-neighbor-solicit, ind-neighbor-advert, mld2-listener-report } accept 
                             meta l4proto icmp icmp type { destination-unreachable, router-solicitation, router-advertisement, time-exceeded, parameter-problem } accept 
                             ip protocol igmp accept 
                             
                             udp dport mdns ip6 daddr ff02::fb accept 
                             udp dport mdns ip daddr 224.0.0.251 accept 
                             
                             udp sport 1900 udp dport >= 1024 ip6 saddr { fd00::/8, fe80::/10 } meta pkttype unicast limit rate 4/second burst 20 packets accept 
                             udp sport 1900 udp dport >= 1024 ip saddr { 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, 169.254.0.0/16 } meta pkttype unicast limit rate 4/second burst 20 packets accept 
                             
                             udp sport netbios-ns udp dport >= 1024 meta pkttype unicast ip6 saddr { fd00::/8, fe80::/10 } accept 
                             udp sport netbios-ns udp dport >= 1024 meta pkttype unicast ip saddr { 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, 169.254.0.0/16 } accept 
                             
                             counter 
                             }
                             
                             chain my_forward {
                             type filter hook forward priority 0; policy drop;
                             # Drop everything forwarded to us. We do not forward. That is routers job.
                             }
                             
                             chain my_output {
                             type filter hook output priority 0; policy accept;
                             # Accept every outbound connection
                             }
                             
                             } 
                             "; 

                             };

                               
 # Enable CUPS to print documents.
 services.printing.enable = true;
 services.printing.drivers = [ pkgs.gutenprint ];
 
 # Enable sound.
 sound.enable = true;
 hardware.pulseaudio.enable = true;
 
 # Enable the X11 windowing system.
 services.xserver = {
 enable = true;
 layout = "us";
 videoDrivers = [ "modesetting" ];
 displayManager.lightdm.enable = true;
 desktopManager.xfce.enable = true;
 };
 
 # services.xserver.xkbOptions = "eurosign:e";
 
 # Enable touchpad support.
 services.xserver.libinput.enable = true;
 
 # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.reza = {
 isNormalUser = true;
 extraGroups = [ "vboxusers" "wheel" "networkmanager" "audio" "video" ];
 description = "Reza Maulana";
 };
 
 # This value determines the NixOS release from which the default
 # settings for stateful data, like file locations and database versions
 # on your system were taken. It‘s perfectly fine and recommended to leave
 # this value at the release version of the first install of this system.
 # Before changing this value read the documentation for this option
 # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
 system.stateVersion = "20.03"; # Did you read the comment?
 
 
 # filesystem/fstab
 fileSystems."/" ={
   fsType = "ext4";
 options = [ "noatime,defaults" ];
 };
 
 
 fileSystems."/boot" ={
   fsType = "vfat";
 options = [ "noatime,defaults" ];
 };
 
 services.fstrim = {
 enable = true;
 interval = "weekly";
 };
 
 # Custom services
 ## tlp
 services  = {
           tlp = {
           enable = true;
           extraConfig = "
           START_CHARGE_THRESH_BAT0=90
           STOP_CHARGE_THRESH_BAT0=96
           RESTORE_THRESHOLDS_ON_BAT=1
           NATACPI_ENABLE=1
           TPACPI_ENABLE=1       
           TPSMAPI_ENABLE=1
           CPU_SCALING_GOVERNOR_ON_AC=performance
           CPU_SCALING_GOVERNOR_ON_BAT=powersave
           CPU_ENERGY_PERF_POLICY_ON_AC=performance
           CPU_ENERGY_PERF_POLICY_ON_BAT=balance_power
           CPU_BOOST_ON_AC=1
           CPU_BOOST_ON_BAT=0
           ";
           };
           };
 
 # custom systemd/systemctl arguments
 systemd.services                = {
 network-addresses-enp0s26u1u2.enable = false;
 network-link-enp0s26u1u2.enable = false;
 };
 
 
 # emacs
 services.emacs.defaultEditor    = true;
 
 # shell
 programs.bash.enableCompletion  = true;
 environment                     = {
 variables = {
 EDITOR = "emacs";
 };
 
 shellAliases = {
 vim = "nvim";
 ec = "emacs";
 };
 
 };
 
 # java/jdk
 programs.java = {
 enable = true;
 package = pkgs.jdk11;
 };
 
 # thinkfan
 services.thinkfan = {
            enable       = true;
            fan          = "tp_fan /proc/acpi/ibm/fan";
            levels       = ''
             (0,     0,      55)
             (1,     48,     60)
             (2,     50,     61)
             (3,     52,     63)
             (6,     56,     65)
             (7,     60,     85)
             (127,   80,     32767)
                    '';
            sensors      = "tp_thermal /proc/acpi/ibm/thermal (0,0,10)";
            smartSupport = true;
 
 };
 
 
 }
