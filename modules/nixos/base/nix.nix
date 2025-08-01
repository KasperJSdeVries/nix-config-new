{
  config,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = lib.mkForce true;

  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  nix.channel.enable = false;

  # TODO: secrets
  # nix.extraOptions = ''
  #   ${config.age.secrets.nix-access-token.path}
  # '';
}
