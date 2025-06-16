{ pkgs, lib, config, ... }:

{
  languages.rust = {
    enable = true;
    channel = "stable";
  };

  # See full reference at https://devenv.sh/reference/options/
}

