_: let
  workerConfig = hostname: {
    inherit hostname;
    identityFile = ["~/.ssh/ai-cluster-master"];
    port = 22;
  };
in {
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

      "worker" = workerConfig "worker";
      "worker-2" = workerConfig "worker-2";
    };
  };
}
