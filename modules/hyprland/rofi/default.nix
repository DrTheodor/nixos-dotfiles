{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./package.nix
  ];

  programs.rofi-wayland = {
    enable = true;
    plugins = [ pkgs.rofimoji ];

    extraConfig = import ./../../../settings/rofi/settings.nix;
  };
}