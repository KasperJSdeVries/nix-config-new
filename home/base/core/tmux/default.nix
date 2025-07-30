{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    prefix = "C-a";

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin-theme-name "mocha"
        '';
      }
      pkgs.tmuxPlugins.urlview
      pkgs.tmuxPlugins.yank
    ];

    customPaneNavigationAndResize = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;

    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";

    extraConfig = ''
      bind s split-window -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
