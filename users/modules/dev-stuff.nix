{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    gh
    visualvm
    zulu17
    git

    vscodium
    jetbrains.idea-community
    jetbrains.rust-rover
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}