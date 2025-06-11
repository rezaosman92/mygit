{config, ...}:


let
  hasIPv6Internet = true;
  StateDirectory = "dnscrypt-proxy";
in
{
  # See https://wiki.nixos.org/wiki/Encrypted_DNS
  services.dnscrypt-proxy2 = {
    enable = true;
    # See https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
    settings = {
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3"; # See https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        cache_file = "/var/lib/${StateDirectory}/public-resolvers.md";
      };

      # Use servers reachable over IPv6 -- Do not enable if you don't have IPv6 connectivity
      ipv6_servers = hasIPv6Internet;
      block_ipv6 = ! (hasIPv6Internet);

      require_dnssec = true;
      require_nolog = false;
      require_nofilter = true;
      odoh_servers = true;

      # If you want, choose a specific set of servers that come from your sources.
      # Here it's from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      # If you don't specify any, dnscrypt-proxy will automatically rank servers
      # that match your criteria and choose the best one.
      # server_names = "NextDNS-b6ec66";
      #  static = {
      #         "NextDNS-b6ec66" = {
      #          stamp = "sdns://AgEAAAAAAAAAAAAOZG5zLm5leHRkbnMuaW8HL2I2ZWM2Ng";
      #         };
      #     };
  };

  };

  systemd.services.dnscrypt-proxy2.serviceConfig.StateDirectory = StateDirectory;

  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    # If using dhcpcd:
    # dhcpcd.extraConfig = "nohook resolv.conf";
    # If using NetworkManager:
    networkmanager.dns = "none";
  };

  # Make sure you don't have services.resolved.enable on.

}
