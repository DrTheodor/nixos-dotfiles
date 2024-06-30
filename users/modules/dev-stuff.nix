{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./terminal.nix
  ];

  home.packages = with pkgs; [
    # java
    visualvm
    zulu17

    # rust
    rustc
    cargo

    # code editors
    neovim
    neovide
    vscodium
    jetbrains.idea-community
    jetbrains.rust-rover
    godot_4

    gh
    gitbutler
    git
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
