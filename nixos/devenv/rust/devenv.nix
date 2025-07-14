{
  pkgs,
  lib,
  config,
  ...
}:

{
  languages.rust = {
    enable = true;
    channel = "stable";
  };

  packages = with pkgs; [
    lldb
    openssl
    rustfmt
  ];

  # See full reference at https://devenv.sh/reference/options/
}
