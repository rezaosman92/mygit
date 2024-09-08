let

  pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz")) {};

  # Rolling updates, not deterministic.
  # pkgs = import (fetchTarball("channel:nixpkgs-unstable")) {};
in pkgs.mkShell {
  buildInputs = with pkgs; [ 
  
  cargo 
  rustc 
  rustfmt
  rust-analyzer
  clippy
  
  ];

  shellHook = ''
    export PATH=/home/reza/.cargo/bin:$PATH
  '';
}
