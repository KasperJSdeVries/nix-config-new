{pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    playerctl
    pulsemixer
    imv

    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
    nvitop
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [pkgs.mpvScripts.mpris];
  };

  services.playerctld.enable = true;
}
