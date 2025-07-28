{
  pkgs,
  config,
  lib,
  myvars,
  ...
}:
with lib; let
  cfgWayland = config.modules.desktop.wayland;
in {
  imports = [
    ./base
    ../base

    ./desktop
  ];

  options.modules.desktop = {
    wayland = {
      enable = mkEnableOption "Wayland Display server";
    };
  };

  config = mkMerge [
    (mkIf cfgWayland.enable {
      services = {
        xserver.enable = false;
        greetd = {
          enable = true;
          settings = {
            default_session = {
              user = myvars.username;
              command = "$HOME/.wayland-session";
            };
          };
        };
      };
      security.pam.services.hyprlock = {};
    })
  ];
}
