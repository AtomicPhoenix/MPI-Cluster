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
    interfaces.enp0s20f0u2 = {
      ipv4.addresses = [
        {
          address = "10.0.0.1";
          prefixLength = 24;
        }
      ];
    };
  };

  users.users.ai.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICq0GzHUelKoq7LVIb8ODTAau6Nehwa5UuctDWmWYj3d ai@master"
  ];
}
