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
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [ "acpi_backlight=native" ];

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };

}
