{
  pkgs,
  config,
  lib,
  ...
}: let
  localBin = "${config.home.homeDirectory}/.local/bin";
  goBin = "${config.home.homeDirectory}/go/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";

  zshDir = "${config.xdg.configHome}/zsh";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:${localBin}:${goBin}:${rustBin}"
    '';
  };

  programs.zsh = {
    enable = true;

    history = {
      path = "${zshDir}/.zsh_history";
    };

    dotDir = zshDir;

    completionInit = ''
      autoload -Uz compinit
      compinit -d ${zshDir}/.zcompdump
    '';

    envExtra = ''
      export SHELL_SESSIONS_DISABLE=1
      export PATH="$PATH:${localBin}:${goBin}:${rustBin}"
    '';

    initContent = '''';

    autosuggestion.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
    };
  };
}
