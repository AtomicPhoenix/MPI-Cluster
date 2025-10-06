{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # nvidia programs
      cudatoolkit
      cudaPackages.cudatoolkit
      cudaPackages.nccl
      cudaPackages.cuda_opencl
      cudaPackages.cuda_nvcc
      cudaPackages.cuda_gdb
      cudaPackages.cuda_cudart
      nvtopPackages.nvidia
    ];

    sessionPath = [
      "${pkgs.cudaPackages.cudatoolkit}/bin"
    ];

    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.cudaPackages.cudatoolkit}/lib";
      CPLUS_INCLUDE_PATH = "${pkgs.cudaPackages.cudatoolkit}/share/cuda/samples/common/inc";
    };
  };
}
