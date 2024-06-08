{ pkgs, config, lib, inputs, ... }:

with lib;

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cd = "z";
      sl = "eza";
      ls = "eza";
      l = "eza -l";
      la = "eza -la";
      rebuild = "sudo nixos-rebuild switch";
      nixos-clean = "sudo nix-collect-garbage -d";
      nixos-update = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .";
      just-rider = "NIXPKGS_ALLOW_UNFREE=1 nix shell nixpkgs#jetbrains.rider --impure && nohup rider >/dev/null 2>&1 &";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  programs.bash.enable = true; # just in case
  programs.oh-my-posh.enable = true;

  programs.zoxide.enable = true;

  programs.rofi-wayland.terminal = "kitty";

  programs.kitty = {
    enable = true;
    extraConfig = readFile ./../../settings/kitty.conf;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    eza
    jetbrains-mono
    nerdfonts
  ];
}
