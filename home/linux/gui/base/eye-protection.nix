{
  services.gammastep = {
    enable = true;

    tray = false;
    temperature = {
      day = 6000;
      night = 4500;
    };

    settings = {
      general = {
        fade = "1";
        location-provider = "manual";
      };
      manual = {
        lat = "52.0";
        lon = "4.4";
      };
    };
  };
}
