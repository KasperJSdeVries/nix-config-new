{
  mylib,
  config,
  ...
}: let
  hostName = "iana";
in {
  imports = mylib.scanPaths ./.;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    inherit hostName;

    networkmanager.enable = false;
    useDHCP = false;
  };

  networking.useNetworkd = true;
  systemd.network.enable = true;

  system.stateVersion = "25.05";
}
