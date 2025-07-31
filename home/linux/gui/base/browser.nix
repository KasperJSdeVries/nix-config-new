{
  pkgs,
  zen-browser,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    zen-browser.packages.${pkgs.system}.default
  ];
}
