{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.swaync;

in {
  options.programs.swaync = {
    enable = mkEnableOption
      "A simple GTK based notification daemon for SwayWM";

    package = mkOption {
      default = pkgs.swaynotificationcenter;
      type = types.package;

      description = ''
        Package providing the {command}`swaync` binary.
      '';
    };

    finalPackage = mkOption {
      type = types.package;
      readOnly = true;
      description = ''
        Resulting customized swaync package.
      '';
    };

    configPath = mkOption {
      default = "${config.xdg.configHome}/swaync/config.json";
      defaultText = "$XDG_CONFIG_HOME/swaync/config.json";
      type = types.str;
      description = "Path where to put generated configuration file.";
    };

    stylePath = mkOption {
      default = "${config.xdg.configHome}/swaync/style.css";
      defaultText = "$XDG_CONFIG_HOME/swaync/style.css";
      type = types.str;
      description = "Path where to put generated style file.";
    };

    settings = mkOption {
      default = { };
      type = types.attrs;
      description = "Additional configuration to add.";
    };

    style = mkOption {
      default = null;
      type = types.nullOr types.str;
      description = "Style to use.";
    };
  };

  config = mkIf cfg.enable {
    assertions =
      [ (hm.assertions.assertPlatform "programs.swaync" pkgs platforms.linux) ];

    programs.swaync.finalPackage = cfg.package;
    home.packages = [ cfg.finalPackage ];

    home.file."${cfg.configPath}".text = builtins.toJSON cfg.settings;
    home.file."${cfg.stylePath}" = mkIf (cfg.style != null) ({ text = cfg.style; });
  };
}