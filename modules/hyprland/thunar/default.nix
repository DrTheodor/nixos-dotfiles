{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home-manager.users.theo.imports = with pkgs; [
    ./hm.nix
  ];

  # for thunar
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}