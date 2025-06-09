{config, ...}:

{
  services.dnscrypt-proxy2 = {

    enable = true;
    settings = {

      server_names = "NextDNS-b6ec66";
      static = {
              "NextDNS-b6ec66" = {
                stamp = "sdns://AgEAAAAAAAAAAAAOZG5zLm5exdG5zLm5pby9iNmVjNjY";
              };
            };

      require_dnssec = true;
      ipv6_servers = true;
      listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];

    };
  };


  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    # dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.dns = "none";
  };

  # Make sure you don't have services.resolved.enable on.

}
