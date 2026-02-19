_: { hardware = {
    # Enable hardware accelerated graphics drivers.
    graphics.enable = true;

    nvidia = {
      open = false;  
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };
}
