{pkgs, ...}: {
  home.packages = with pkgs; [
    # db
    pgcli
    sqlite
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
