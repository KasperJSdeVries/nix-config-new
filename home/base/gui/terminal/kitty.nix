{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetbrainsMono NF";
      size = 14;
    };

    settings = {
      enable_audio_bell = false;
      shell = "${pkgs.tmux}/bin/tmux new-session -A -D -s main";
      background_opacity = "0.7";
    };

    themeFile = "Catppuccin-Mocha";
  };
}
