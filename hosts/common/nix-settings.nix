_: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Perform garbage collection weekly to maintain low disk usage
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    # Remove nix-channel related tools & configs
    # We use flakes instead.
    channel.enable = false;

    settings = {
      # Optimizes storage by automatically finding store files with identical contents and replacing them with hard links to a single copy.
      auto-optimise-store = true;
    };
  };
}
