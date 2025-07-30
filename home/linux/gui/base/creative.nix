{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    krita
  ];

  programs.obs-studio = {
    enable = pkgs.stdenv.isx86_64;
    plugins = with pkgs.obs-studio-plugins;
      [
        wlrobs
        obs-teleport
        droidcam-obs
        obs-vkcapture
        obs-gstreamer
        input-overlay
        obs-multi-rtmp
        obs-source-clone
        obs-livesplit-one
        looking-glass-obs
        obs-vintage-filter
        obs-command-source
        obs-move-transition
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ]
      ++ (lib.optionals pkgs.stdenv.isx86_64 [
        obs-vaapi
        obs-3d-effect
      ]);
  };
}
