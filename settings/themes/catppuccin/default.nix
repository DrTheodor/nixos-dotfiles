{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home-manager.users.theo.imports = with pkgs; [
    ./hm.nix
  ];

  services.displayManager.sddm.theme = "catppuccin-mocha";
}