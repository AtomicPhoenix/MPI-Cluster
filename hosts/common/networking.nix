{lib, ...}: {
  services.resolved.enable = true;
  networking = {
    nameservers = ["8.8.8.8"];

    # Enable firewall
    firewall = {
      checkReversePath = false;
      enable = false;
      allowedTCPPorts = [80 2049];
    };

    # Enable networking
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    hosts = {
      "10.0.0.80" = ["master"];
      "10.0.0.81" = ["worker"];
      "10.0.0.82" = ["worker-2"];
    };

    # Enables DHCP on each ethernet and wireless interface.
    useDHCP = lib.mkDefault true;
  };
}
