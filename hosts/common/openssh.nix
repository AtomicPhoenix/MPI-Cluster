_: {
  networking.firewall.allowedTCPPorts = [22];

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      AllowUsers = ["gpgup"];
      UseDns = true;
      X11Forwarding = false;
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };
}
