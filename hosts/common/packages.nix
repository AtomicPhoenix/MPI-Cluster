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

    # nvidia programs
    cudaPackages.nccl
    cudaPackages.cudatoolkit
    cudaPackages.cuda_opencl
    cudaPackages.cuda_nvcc
    cudaPackages.cuda_gdb
    cudaPackages.cuda_cudart
    cudaPackages.backendStdenv
    nvtopPackages.nvidia

    nvidia-container-toolkit

    openmpi
    gcc13Stdenv.cc
    bear
    clang-tools
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    mesa
    mesa-gl-headers
    glui
    libGL
    libGLU
    pkg-config
    prrte
    sfml
    vcpkg
    vcpkg-tool
  ];
}
