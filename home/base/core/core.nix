{pkgs, ...}: {
  home.packages = with pkgs; [
    gnupg
    gnumake

    fzf
    fd
    (ripgrep.override {withPCRE2 = true;})

    ast-grep

    sad
    yq-go
    just
    hyperfine
    gping
    doggo
    duf
    du-dust
    gdu

    nix-output-monitor
    hydra-check
    nix-index
    nix-init
    nix-melt
    nix-tree

    caddy
    croc
    ncdu
  ];

  programs.eza = {
    enable = true;
    enableNushellIntegration = false;
    git = true;
    icons = "auto";
  };

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };

  programs.fzf.enable = true;

  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    settings = {
      display = {
        compact = false;
        use_pager = true;
      };
      updates = {
        auto_update = false;
        auto_update_interval_hours = 720;
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
