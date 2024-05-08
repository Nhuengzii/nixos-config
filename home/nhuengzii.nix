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
  home.packages = let 
    vscode = pkgs.writeShellScriptBin "code" ''
      unset NIXOS_OZONE_WL
      exec ${pkgs.vscode}/bin/code
    '';
    runx = pkgs.writeShellScriptBin "runx" ''
      function runx {
        if [[ $2 -ne "" ]]; then
          nix-shell -p $2 --run $1
        else
          nix-shell -p $1 --run $1
        fi
      }
    '';
  in
  with pkgs; [
    neofetch armcord microsoft-edge
    gh lazygit kitty rofi feh picom flameshot
    arandr ripgrep fd bat fzf networkmanagerapplet dunst libnotify brightnessctl
    pavucontrol runx
  ] ++ [vscode];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

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
