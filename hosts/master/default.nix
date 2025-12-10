{
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include common configuration
    ../common
  ];

  hardware.enableAllFirmware = true;
  hardware.firmware = [pkgs.linux-firmware];

  # Define hostname.
  networking = {
    hostName = "master";
    networkmanager.ensureProfiles.profiles.cluster_net = {
      connection = {
        id = "cluster_net";
        type = "ethernet";
        uuid = "2862ff31-1419-4cb1-bae3-5ab0ffe7574a";
      };
      ipv4 = {
        address1 = "10.0.0.80/24";
        method = "manual";
      };
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
