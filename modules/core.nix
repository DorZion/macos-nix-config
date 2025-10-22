{
  lib,
  pkgs,
  ...
}: {
  # enable flakes globally
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.enable = true;

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.lixPackageSets.stable.lix;
  programs.nix-index.enable = false;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 1w";
  };

  nix.optimise.automatic = true;
}
