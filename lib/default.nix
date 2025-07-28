{lib, ...}: {
  nixosSystem = import ./nixosSystem.nix;

  relativeToRoot = lib.path.append ../.;
  scanPaths = path:
    builtins.map (f: (path + "/${f}")) (
      builtins.attrNames (
        lib.filterAttrs (
          path: type: (type == "directory") || ((path != "default.nix") && (lib.hasSuffix ".nix" path))
        ) (builtins.readDir path)
      )
    );
  listDirs = path: builtins.attrNames (lib.filterAttrs (_: type: type == "directory") (builtins.readDir path));
}
