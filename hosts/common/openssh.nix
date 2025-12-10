_: {
  networking.firewall.allowedTCPPorts = [22];

  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      AllowUsers = ["ai"];
      UseDns = true;
      X11Forwarding = false;
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "prohibit-password";
    };
  };
}
