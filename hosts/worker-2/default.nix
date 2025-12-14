{lib, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Include common configuration
    ../common
  ];

  # Define hostname.
  networking = {
    hostName = "worker-2";
    networkmanager.ensureProfiles.profiles.cluster_net = {
      connection = {
        id = "cluster_net";
        interface-name = "enp0s20f0u2";
        type = "ethernet";
        uuid = "2d2bdf35-5b3e-471c-9b0a-549ce8506682";
      };
      ipv4 = {
        address1 = "10.0.0.82/24";
        method = "manual";
      };
    };
  };

  users.users.gpgup.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICq0GzHUelKoq7LVIb8ODTAau6Nehwa5UuctDWmWYj3d ai@master"
  ];
}
