{ config, pkgs, lib, inputs, ... }:

let
  settings = import ./../settings/general.nix;
in
{
  imports = [
    "${settings.theme}"
    ./user.nix
  ] ++ (lib.optionals (settings.nvidia) [
    ../nvidia.nix
  ]);

  # Set your time zone.
  time.timeZone = settings.timeZone;

  # Select internationalisation properties.
  i18n.defaultLocale = settings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = settings.extra;
    LC_IDENTIFICATION = settings.extra;
    LC_MEASUREMENT = settings.extra;
    LC_MONETARY = settings.extra;
    LC_NAME = settings.extra;
    LC_NUMERIC = settings.extra;
    LC_PAPER = settings.extra;
    LC_TELEPHONE = settings.extra;
    LC_TIME = settings.extra;
  };

  home-manager.users.theo.imports = [
    {
      home.keyboard = {
        layout = settings.keyboard.layout;
        options = [ settings.keyboard.options ];
      };

      wayland.windowManager.hyprland.settings.input = {
        kb_layout = settings.keyboard.layout;
        kb_options = settings.keyboard.options;
      };
    }
  ];
}