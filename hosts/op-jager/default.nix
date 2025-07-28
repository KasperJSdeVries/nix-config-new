{...}: let
  hostName = "jager";
in {
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix

    ./boot.nix
  ];

  networking = {
    inherit hostName;

    networkmanager.enable = false;
    useDHCP = false;
  };

  networking.useNetworkd = true;
  systemd.network.enable = true;

  system.stateVersion = "25.05";
}
