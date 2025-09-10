{...}: {
  imports = [
    ./boot.nix
    ./hardware.nix
    ./logind.nix
    ./networking.nix
    ./nix-settings.nix
    ./openssh.nix
    ./packages.nix
    ./time-and-locale.nix
  ];

  users.users = {
    ai = {
      home = "/home/ai";
      isNormalUser = true;
      description = "Cluster User";
      extraGroups = ["networkmanager" "wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHMD7R3C50biFqJaBhIXYQZNCKtsM/e35Oh7b1h6ESSX ai@ai-duo"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGdhbEfOlA2Q4y1OHY4MdFOkcQpuZzJKaPxqFFsyngHM ai@ai-desk"
      ];
    };
  };
}
