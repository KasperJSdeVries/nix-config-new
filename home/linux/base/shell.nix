{
  config,
  myvars,
  ...
}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  home.homeDirectory = "/home/${myvars.username}";

  home.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    BROWSER = "zen";

    DELTA_PAGER = "less -R";
  };
}
