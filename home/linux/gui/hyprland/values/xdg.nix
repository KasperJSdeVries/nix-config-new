{pkgs, ...}: {
  xdg.portal = {
    enable = true;

    config.common = {
      default = [
        "gtk"
        "hyprland"
      ];
    };

    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
