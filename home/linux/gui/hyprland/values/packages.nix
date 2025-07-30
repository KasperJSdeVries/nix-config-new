{pkgs, ...}: {
  home.packages = with pkgs; [
    swaybg
    wl-clipboard
    hyprpicker
    brightnessctl

    hyprshot
    wf-recorder

    alsa-utils
    networkmanagerapplet
  ];
}
