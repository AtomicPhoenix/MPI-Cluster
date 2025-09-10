_: {
  hardware = {
    # Enable hardware accelerated graphics drivers.
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };
}
