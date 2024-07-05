{ pkgs, config, lib, inputs, ... }:

with lib;

let
  settings = import ../../settings/hyprland.nix;
in
{
  imports = with inputs; [
    ./waybar.nix
    ./notifications
    ./rofi
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = ({
      exec-once = [
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swaynotificationcenter}/bin/swaync --style $HOME/.config/swaync/style.css"
        "${pkgs.swww}/bin/swww init"
      ];

      "$mod" = "SUPER";
    } // settings);
  };

  home.packages = with pkgs; [
    swww # Wallpapers!
    grim
    grimblast
    libnotify
    wl-clipboard
  ];
}
