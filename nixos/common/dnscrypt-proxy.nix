{config, ...}:

{
  services.dnscrypt-proxy = {

    enable = true;
    settings = {

      server_names = "NextDNS-b6ec66";
      static = "NextDNS-b6ec66";
      stamp = "sdns://AgEAAAAAAAAAAAAOZG5zLm5leHRkbnMuaW8HL2I2ZWM2Ng";

    };
  };
}
