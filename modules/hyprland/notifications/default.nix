{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./package.nix
  ];

  services.swaync = {
    enable = true;
    settings = readFile ../../../settings/swaync.nix;
  };
}
