{ pkgs, config, lib, inputs, ... }:

with lib;

{
  home.packages = with pkgs; [
    gnome.file-roller

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.exo # thunar's "open terminal here"
    xfce.xfconf  # required for thunar
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
    };
  };
}