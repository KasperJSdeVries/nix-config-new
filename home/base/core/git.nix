{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {
  home.activation.removeExistingGitConfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
    hosts = {
      "github.com" = {
        "users" = {
          "KasperJSdeVries" = null;
        };
        "user" = "KasperJSdeVries";
      };
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = myvars.userfullname;
    userEmail = myvars.useremail;

    includes = [
      {
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];

    extraConfig = {
      init.defaultBranch = "main";
      trim.bases = "develop,master,main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      log.date = "iso";

      url = {
        "ssh://git@github.com/KasperJSdeVries" = {
          insteadOf = "https://github.com/KasperJSdeVries";
        };
      };
    };

    delta = {
      enable = true;
      options = {
        diff-so-fancy = true;
        line-numbers = true;
        true-color = "always";
      };
    };
  };

  programs.lazygit.enable = true;

  programs.gitui.enable = true;
}
