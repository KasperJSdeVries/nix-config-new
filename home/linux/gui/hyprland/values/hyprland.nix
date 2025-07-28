{
  pkgs,
  config,
  ...
}: let
  package = pkgs.hyprland;
in {
  xdg.configFile = let
    mkSymlink = config.lib.file.mkOutOfStoreSymlink;
    hyprPath = "${config.home.homeDirectory}/nix-config/home/linux/gui/hyprland/conf";
  in {
    "waybar".source = mkSymlink "${hyprPath}/waybar";
    "hypr/hypridle.conf".source = mkSymlink "${hyprPath}/hypridle.conf";
    "hypr/configs".source = mkSymlink "${hyprPath}/configs";
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  catppuccin.waybar.enable = false;

  programs.hyprlock.enable = true;

  wayland.windowManager.hyprland = {
    inherit package;
    enable = true;

    settings = {
      source = let
        configPath = "${config.home.homeDirectory}/.config/hypr/configs";
      in [
        "${configPath}/exec.conf"
        "${configPath}/keybindings.conf"
        "${configPath}/settings.conf"
        "${configPath}/windowrules.conf"
      ];
      env = [
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
        "MOZ_WEBRENDER,1"
        "GDK_BACKEND,wayland"
        "XDG_SESSION_TYPE,wayland"
      ];
    };

    systemd = {
      enable = true;
      variables = ["--all"];
    };
  };

  home.file.".wayland-session" = {
    source = "${package}/bin/hyprland";
    executable = true;
  };
}
