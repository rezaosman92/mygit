
{ config, ... }:

{

fileSystems = {
"/".options = [ "compress-force=zstd:3" "noatime" ];

"/home".options = [ "compress-force=zstd:3" "noatime" ];

"/nix".options = [ "compress-force=zstd:3" "noatime" ];

};
  
  
}

