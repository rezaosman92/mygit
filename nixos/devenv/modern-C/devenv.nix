{
  pkgs,
  lib,
  config,
  ...
}:
let
  GREET = "You are inside Modern C devenv";
in

{
  languages.c = {
    enable = true;
  };

  packages = with pkgs; [
    lldb
    cowsay
    lolcat
  ];

  enterShell = ''
    echo ${GREET} | cowsay | lolcat

    # See full reference at https://devenv.sh/reference/options/
  '';
}
