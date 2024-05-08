{ config, pkgs, ...}:
let
  nixos-config_path = "/home/nhuengzii/nixos-config/";
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild-switch = "sudo nixos-rebuild switch --flake ${nixos-config_path}"; 
      rebuild-test = "sudo nixos-rebuild test --flake ${nixos-config_path}";
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };
  programs.zoxide.enable = true;
}
