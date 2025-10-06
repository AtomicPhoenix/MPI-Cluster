{lib, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include common configuration
    ../common
  ];

  # Define hostname.
  networking = {
    hostName = "worker";
    networkmanager.ensureProfiles.profiles.local_ethernet = {
      connection = {
        id = "local_ethernet";
        interface-name = "enp0s31f6";
        timestamp = "1757911697";
        type = "ethernet";
        uuid = "bf62aeee-376a-43c0-89a2-73dc70941ee7";
      };
      ethernet = {};
      ipv4 = {
        address1 = "10.0.0.81/24";
        method = "manual";
      };
      ipv6 = {
        addr-gen-mode = "default";
        method = "auto";
      };
      proxy = {};
    };
  };

  # Connect to NFS Server
  fileSystems."/nfs/shared" = {
    device = "10.0.0.2:/shared";
    fsType = "nfs";
    options = [
      "nfsvers=4.2"
    ];
  };

  users.users.ai.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICq0GzHUelKoq7LVIb8ODTAau6Nehwa5UuctDWmWYj3d ai@master"
  ];
}
