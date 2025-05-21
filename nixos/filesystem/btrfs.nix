
{ config, ... }:

{

fileSystems = {
"/".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/home".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/var/log".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/var/cache".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/nix".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

};
  
  
}

