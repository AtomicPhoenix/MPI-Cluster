{lib, ...}: {
  services.resolved.enable = true;
  networking = {
    nameservers = ["8.8.8.8"];

    # Enable firewall
    firewall = {
      checkReversePath = false;
      enable = true;
      allowedTCPPorts = [80];
    };

    # Enable networking
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    hosts = {
      "10.0.0.2" = ["master"];
      "10.0.0.3" = ["worker"];
    };

    # Enables DHCP on each ethernet and wireless interface.
    useDHCP = lib.mkDefault true;
  };
}
