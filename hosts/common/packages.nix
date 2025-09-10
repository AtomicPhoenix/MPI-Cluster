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

    # OpenMPI
    mpi

    # nvidia programs
    cudaPackages.nccl
    cudaPackages.cudatoolkit
    cudaPackages.cuda_opencl
    cudaPackages.cuda_nvcc
    cudaPackages.cuda_gdb
    cudaPackages.cuda_cudart
    cudaPackages.backendStdenv
    nvtopPackages.nvidia
  ];
}
