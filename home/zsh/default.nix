{ config, pkgs, ... }:
let
  nixos-config_path = "/home/nhuengzii/nixos-config/";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      rebuild-switch = "sudo nixos-rebuild switch --flake ${nixos-config_path}";
      rebuild-test = "sudo nixos-rebuild test --flake ${nixos-config_path}";
    };
    initExtraFirst = ''
      zstyle ':completion:*' menu select
    '';
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  };
  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };
}
