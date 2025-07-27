{ config, pkgs, ... }:

{

  nix.settings.trusted-users = [
    "root"
    "reza"
  ];

  users.users.reza = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "adbusers"
      "libvirtd"
      "scanner"
      "lp"
      "vboxusers"
    ];
    description = "Reza Maulana";
  };

}
