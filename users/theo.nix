{ pkgs, config, lib, inputs, ... }:

with lib;

{
  imports = with inputs; [
    ./modules/dev-stuff.nix
    ./modules/minecraft.nix
  ];

  home.packages = with pkgs; [
    vesktop
    htop
    spotify
    space-station-14-launcher
    steam
    gnome.gnome-disk-utility
    kdenlive
    vlc
    onlyoffice-bin
    corefonts
    gnome-text-editor
    aseprite
    qbittorrent
    alsa-oss
    reaper
    vivaldi-ffmpeg-codecs
    oath-toolkit
  ];

  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    };
    commandLineArgs = [];
    extensions = [];
  };
  
  home.stateVersion = "23.11";
}
