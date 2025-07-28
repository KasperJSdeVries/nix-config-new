{
  myvars,
  config,
  ...
}: {
  users.mutableUsers = true;

  users.groups = {
    "${myvars.username}" = {};
    podman = {};
    wireshark = {};
    plugdev = {};
    uinput = {};
  };

  users.users."${myvars.username}" = {
    home = "/home/${myvars.username}";
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "networkmanager"
      "wheel"
      "podman"
      "wireshark"
      "libvirtd"
    ];
  };
}
