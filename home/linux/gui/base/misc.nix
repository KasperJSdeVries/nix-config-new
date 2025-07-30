{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
  ];

  fonts.fontconfig.enable = false;
}
