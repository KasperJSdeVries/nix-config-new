{pkgs, ...}: {
  xdg.terminal-exec = {
    enable = true;
    package = pkgs.xdg-terminal-exec-mkhl;
    settings = let
      my_terminal_desktop = [
        "Alacritty.desktop"
        "kitty.desktop"
      ];
    in {
      GNOME = my_terminal_desktop ++ ["org.gnome.Terminal.desktop"];
      niri = my_terminal_desktop;
      default = my_terminal_desktop;
    };
  };

  xdg.portal = {
    enable = true;

    config = {
      common = {
        default = ["gtk"];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };

    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
