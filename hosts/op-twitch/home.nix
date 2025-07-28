{config, ...}: {
  modules.desktop = {
    hyprland = {
      nvidia = false;
    };
  };

  programs.ssh.matchBlocks."github.com".identityFile = "${config.home.homeDirectory}/.ssh/op-jager";
}
