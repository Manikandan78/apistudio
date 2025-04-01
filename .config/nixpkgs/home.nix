{ config, pkgs, ... }:
{
  home.username = "mani";
  home.homeDirectory = "/home/mani";
  home.stateVersion = "23.11";

  programs.bash.enable = true;
  programs.git.enable = true;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Set Arrow Prompt
  programs.bash.initExtra = ''
    export PS1="➜ \w $ "
  '';

  programs.zsh.initExtra = ''
    export PS1="➜ %~ %(!.#.$) "
  '';

  home.file.".bashrc".source = config.lib.file.mkOutOfStoreSymlink "/home/mani/.bashrc";
  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/home/mani/.zshrc";

  home.packages = with pkgs; [
    neovim
    htop
    tree
    curl
    wget
    git
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.enableNixpkgsRagenCheck = false;

  home.activation = {
    script = ''
      echo "Home Manager has been activated!"
    '';
  };
}
