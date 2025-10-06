{lib, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include common configuration
    ../common
  ];

  # Define hostname.
  networking = {
    hostName = "master";
    networkmanager.ensureProfiles.profiles.cluster_net = {
      connection = {
        id = "cluster_net";
        timestamp = "1759717908";
        type = "ethernet";
        uuid = "2862ff31-1419-4cb1-bae3-5ab0ffe7574a";
      };
      ethernet = {};
      ipv4 = {
        address1 = "10.0.0.80/24";
        method = "manual";
      };
      proxy = {};
    };
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /nfs        10.0.0.0/24(insecure,rw,sync,no_root_squash,no_subtree_check,crossmnt,fsid=0)
      /nfs/shared 10.0.0.0/24(insecure,rw,sync,no_root_squash,no_subtree_check)
    '';
  };
}
