{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    strace
    ltrace
    tcpdump
    lsof

    bpftrace
    bpftop
    bpfmon

    sysstat
    iotop
    iftop
    btop
    nmon
    sysbench

    psmisc
    lm_sensors
    ethtool
    pciutils
    usbutils
    hdparm
    dmidecode
    parted
  ];

  programs.bcc.enable = true;
}
