{config, pkgs, ...}:
{
    programs.kitty = {
      enable = true;
      theme = "moonlight";
      extraConfig = ''
        background_opacity 1
        font_family "CaskaydiaCove Nerd Font"
        enable_audio_bell false
        confirm_os_window_close 0
      '';
    };
}
