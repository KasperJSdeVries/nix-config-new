{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    # nix
    nil
    statix
    alejandra

    # json-like
    terraform-ls
    jsonnet
    jsonnet-language-server
    taplo
    nodePackages.yaml-language-server
    actionlint

    # dockerfile
    hadolint
    nodePackages.dockerfile-language-server-nodejs

    # markdown
    marksman
    glow
    pandoc

    # sql
    sqlfluff

    # c/c++
    cmake
    cmake-language-server
    gnumake
    checkmake
    gcc
    gdb
    clang-tools
    lldb

    # python
    pipx
    uv
    pyright

    # rust
    pkgs-unstable.rustc
    pkgs-unstable.rust-analyzer
    pkgs-unstable.cargo
    pkgs-unstable.rustfmt
    pkgs-unstable.clippy

    # golang
    go
    gomodifytags
    iferr
    impl
    gotools
    gopls
    delve

    # zig
    zls

    # lua
    stylua
    lua-language-server

    # bash
    nodePackages.bash-language-server
    shellcheck
    shfmt

    # web
    nodePackages.vscode-langservers-extracted
    nodePackages.prettier

    # search & analysis
    fzf
    gdu
    (ripgrep.override {withPCRE2 = true;})
  ];
}
