{
  pkgs,
  inputs,
  ...
}: {
  services = {
    xserver.videoDrivers = ["nvidia"];
    tailscale.enable = true;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # SSH protocol implementation
    openssh

    # File editor
    vim

    direnv

    # Git/Github
    git # Git
    gh # Github

    # Terminal
    tmux
    tree
    fastfetch

    # OpenMPI
    mpi
  ];
}
