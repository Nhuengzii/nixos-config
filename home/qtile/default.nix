{ config, pkgs, ...}:
{
  xdg.configFile."qtile".source = ./src;
}
