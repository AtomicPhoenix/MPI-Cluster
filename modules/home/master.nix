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
        identityFile = ["~/.ssh/ai-cluster-internal"];
        port = 8102;
      };
    };
  };
}
