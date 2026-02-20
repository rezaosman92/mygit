{
  pkgs,
  lib,
  config,
  ...
}:

let
  GREET = "You are inside zig devenv";
in

{
  # https://devenv.sh/languages/
  languages = {
    zig.enable = true;
  };

  packages = with pkgs; [
    lldb

    cowsay
    lolcat
  ];

  enterShell = ''
    echo ${GREET} | cowsay | lolcat
    exec fish
  '';

  # See full reference at https://devenv.sh/reference/options/
}
