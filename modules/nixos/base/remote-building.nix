{myvars, ...}: {
  nix.distributedBuilds = true;
  nix.buildMachines = let
    sshUser = myvars.username;
    systems = [
      "x86_64-linux"

      "aarch64-linux"
      "riscv64-linux"
    ];
    supportedFeatures = [
      "benchmark"
      "big-parallel"
      "kvm"
    ];
  in [];
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
