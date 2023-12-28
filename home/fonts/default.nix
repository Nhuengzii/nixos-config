{ pkgs, config, lib, ... }:
{
    fonts.fontconfig.enable = true;
    xdg.configFile = {
        "fontconfig/conf.d/90-thai.conf".source = ./90-thai.conf;
    };
}