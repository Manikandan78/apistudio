{ config, pkgs, ... }:
{
  home.username = "mani";
  home.homeDirectory = "/home/mani";

  home.packages = with pkgs; [
    starship   # Arrow prompt
    zsh
  ];

  programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.starship.enable = true;

  home.file.".bashrc".text = ''
    eval "$(starship init bash)"
  '';

  home.stateVersion = "23.11";
}
