{
  pkgs,
  lib,
  config,
  ...
}:

  let
    GREET = "You are inside Rust devenv";
    in

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

  enterShell = ''
  printf ${GREET}\n | cowsay | lolcat
  '';

  # See full reference at https://devenv.sh/reference/options/
}
