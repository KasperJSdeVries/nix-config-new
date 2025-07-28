{pkgs, ...}: {
  environment.variables.EDITOR = "nvim --clean";

  environment.systemPackages = with pkgs; [
    tealdeer
    fastfetch
    neovim
    just
    nushell
    git
    git-lfs

    zip
    xz
    zstd
    unzipNLS
    p7zip

    gnugrep
    gnused
    gawk
    jq

    mtr
    iperf3
    dnsutils
    ldns
    wget
    curl
    aria2
    socat
    nmap
    ipcalc

    libargon2
    openssl

    file
    findutils
    which
    tree
    gnutar
    rsync
  ];
}
