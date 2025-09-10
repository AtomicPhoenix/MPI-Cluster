{lib, ...}: {
  imports = [
    ./bash.nix
    ./git.nix
    ./nix-direnv.nix
    ./tmux.nix
  ];

  home = {
    username = "ai";
    homeDirectory = lib.mkForce "/home/ai";
    stateVersion = "25.05";
  };
}
