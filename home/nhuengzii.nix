{ pkgs, nvim, ... }:

{
  home.username = "nhuengzii";
  home.homeDirectory = "/home/nhuengzii";
  imports = [
    ./git
    ./kitty
    ./picom
    ./qtile
    ./zsh
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch discord microsoft-edge-dev
    vscode gh lazygit kitty rofi feh picom flameshot
    arandr ripgrep fd bat fzf networkmanagerapplet dunst libnotify brightnessctl
    pavucontrol (nvim)
  ];

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
