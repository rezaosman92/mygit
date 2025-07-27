{ config, pkgs, ... }:

{

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 53 ];
      allowedUDPPorts = [ 53 ];
      #allowedUDPPortRanges = [
      #  { from = 4000; to = 4007; }
      #  { from = 8000; to = 8010; }
      #  ];
    };
    nftables.enable = true;
  };

}
