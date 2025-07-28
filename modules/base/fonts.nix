{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop;
in {
  options.modules.desktop = {
    fonts.enable = lib.mkEnableOption "Rich Fonts - Add NerdFonts Icons, emojis, etc...";
  };

  config.fonts.packages = with pkgs;
    lib.mkIf cfg.fonts.enable [
      material-design-icons
      font-awesome

      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
}
