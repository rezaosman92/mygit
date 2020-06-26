{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "my-FHS-env";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
      gnome2.gtk
      glib
      xorg.libXext
      xorg.libXtst
      sudo
      gnome2.pango
      atk
      cairo
      gdk-pixbuf
      fontconfig
      freetype
      xorg.libxcb
      polkit
      xorg.libXrender
      xorg.libXi
      xorg.libXfixes
      xorg.libXdamage
      xorg.libxkbfile
      gnome2.gtkglext
      libGLU
      libGL
      xorg.libXmu
      xorg.libXt
      xorg.libXext
      xorg.libSM
      xorg.libICE
      pkgconf
      polkit_gnome
      xorg.libXrandr
      pulseaudio
      lsb-release
    ]) ++ (with pkgs.xorg;
      [ libX11
        libXcursor
        libXrandr
      ]);
  multiPkgs = pkgs: (with pkgs;
    [ udev
      alsaLib
    ]);
  runScript = "bash";
}).env
  
