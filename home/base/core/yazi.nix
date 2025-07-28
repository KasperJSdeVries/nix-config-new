{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };
}
