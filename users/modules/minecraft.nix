{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    glfw-wayland-minecraft
    prismlauncher
    blockbench-electron
  ];
}