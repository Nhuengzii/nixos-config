{ config, pkgs, ...}:
{
  xdg.configFile."nixpkgs".source = ./src;
}
