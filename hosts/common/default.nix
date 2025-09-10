{...}: {
  imports = [
    ./boot.nix
    ./hardware.nix
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
    };
  };
}
