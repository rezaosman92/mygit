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
  };

  packages = with pkgs; [
    lldb
    openssl
    rustfmt

    cowsay
    lolcat
  ];

  enterShell = ''
    echo ${GREET} | cowsay | lolcat
  '';

  # See full reference at https://devenv.sh/reference/options/
}
