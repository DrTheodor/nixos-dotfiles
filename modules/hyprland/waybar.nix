{ pkgs, config, lib, inputs, ... }:

with lib;

let
  base = import ./../../settings/waybar/settings.nix;
  modules = import ./../../settings/waybar/modules.nix;
in
{
  programs.waybar = {
    enable = true;

    settings = [
      (base // modules)
    ];
  };

  # Used by waybar
  home.packages = with pkgs; [
    playerctl
    pamixer
    cava
    nvtopPackages.full
    pavucontrol # Audio control
  ];
}