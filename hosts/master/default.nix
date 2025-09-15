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
}
