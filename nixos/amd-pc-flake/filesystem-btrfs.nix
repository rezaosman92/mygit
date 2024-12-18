
{ config, ... }:

{

fileSystems = {
"/".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/home".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

"/var/log".options = [ "compress-force=zstd:3" "defaults" "rw" "discard=async" ];

};
  
  
}

