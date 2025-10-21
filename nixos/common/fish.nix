{ config, pkgs, ... }:

{

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellInit = "if set -q ZELLIJ
                  else
                    zellij
                  end
              ";
  };

  users.defaultUserShell = pkgs.fish;
}
