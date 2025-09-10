{pkgs, ...}: {
  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10; # Limit the number of generations to keep
      };
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs"];
    kernelPatches = [
      # Fix the /proc/net/tcp seek issue
      # Impacts tailscale: https://github.com/tailscale/tailscale/issues/16966
      {
        name = "proc: fix missing pde_set_flags() for net proc files";
        patch = pkgs.fetchurl {
          name = "fix-missing-pde_set_flags-for-net-proc-files.patch";
          url = "https://patchwork.kernel.org/project/linux-fsdevel/patch/20250821105806.1453833-1-wangzijie1@honor.com/raw/";
          hash = "sha256-DbQ8FiRj65B28zP0xxg6LvW5ocEH8AHOqaRbYZOTDXg=";
        };
      }
    ];
  };
}
