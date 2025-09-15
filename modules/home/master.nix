{lib, ...}: {
  imports = [
    ./common
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = ["~/.ssh/ai-cluster-github"];
      };

      "worker" = {
        hostname = "worker";
        identityFile = ["~/.ssh/ai-cluster-master"];
        port = 8102;
      };

      "10.0.0.3" = {
        hostname = "10.0.0.3";
        identityFile = ["~/.ssh/ai-cluster-master"];
        port = 8102;
      };
    };
  };
}
