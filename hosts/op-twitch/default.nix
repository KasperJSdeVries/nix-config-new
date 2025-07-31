{...}: let
  hostName = "twitch";
in {
  imports = [
    ./hardware-configuration.nix

    ./boot.nix
  ];

  networking = {
    inherit hostName;

    networkmanager.enable = true;
    # useDHCP = false;
  };

  # networking.useNetworkd = true;
  # systemd.network.enable = true;

  system.stateVersion = "25.05";
}
