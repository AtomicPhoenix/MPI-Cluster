{lib, ...}: {
  imports = [
    ./bash.nix
    ./cuda.nix
    ./git.nix
    ./nix-direnv.nix
    ./tmux.nix
  ];

  home = {
    username = "gpgup";
    homeDirectory = lib.mkForce "/home/gpgup";
    stateVersion = "25.05";
  };
}
