{ pkgs, lib, config, ... }:

{
  languages.rust = {
    enable = true;
    channel = "stable";
  };

  packages = with pkgs; [
    openssl
  ];

  # See full reference at https://devenv.sh/reference/options/
}

