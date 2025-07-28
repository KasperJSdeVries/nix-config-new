{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.desktop.hyprland;
in {
  options.modules.desktop.hyprland = {
    nvidia = mkEnableOption "whether Nvidia GPU is used";
  };

  config = mkIf (cfg.enable && cfg.nvidia) {
    wayland.windowManager.hyprland.settings.env = [
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "ELECTION_OZONE_PLATFORM_INIT,auto"
      "NVD_BACKEND,direct"

      "GBM_BACKEND,nvidia-drm"
    ];
  };
}
