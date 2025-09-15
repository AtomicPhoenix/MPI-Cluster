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
    interfaces.enp0s20f0u2 = {
      ipv4.addresses = [
        {
          address = "10.0.0.2";
          prefixLength = 24;
        }
      ];
    };
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /nfs        10.0.0.0/24(insecure,rw,sync,no_root_squash,no_subtree_check,crossmnt,fsid=0)
      /nfs/shared 10.0.0.0/24(insecure,rw,sync,no_root_squash,no_subtree_check)
    '';
    statdPort = 4000;
    lockdPort = 4001;
    mountdPort = 4002;
  };
}
