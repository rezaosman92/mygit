{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.memtest86.enable = true;

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      memtest86.enable = true;
      device = "nodev";
      extraConfig = ''
        timeout=3
      '';
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
  };

  boot = {
    kernelModules = [ "acpi_call" ];
    initrd.compressor = "zstd";
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    kernelPackages = pkgs.linuxPackages_6_18;
    # kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "ntfs" ];
    kernelParams = [
      "acpi_backlight=native"
      "quiet"
      "splash"
    ];
  };

  # boot.initrd.compressor = "zstd";
  hardware.firmwareCompression = "zstd";

  console = {
    useXkbConfig = true; # use xkbOptions in tty.
  };

  services.xserver.xkb.layout = "us";

}
