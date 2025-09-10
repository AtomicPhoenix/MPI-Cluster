{lib, ...}: {
  services.resolved.enable = true;
  networking = {
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
      "192.168.21.20" = ["master"];
      "192.168.36.112" = ["worker"];
    };

    # Enables DHCP on each ethernet and wireless interface.
    useDHCP = lib.mkDefault true;
  };
}
