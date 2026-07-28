{
  lib,
  pkgs,
  ...
}: {
  # enable flakes globally
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.enable = true;

  # flakes-only: no root channels profile exists, so keeping it in NIX_PATH
  # just makes every nix invocation warn about the missing path.
  nix.channel.enable = false;

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.lixPackageSets.latest.lix;
  programs.nix-index.enable = false;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 1w";
  };

  nix.optimise.automatic = true;

  # ponytail: nixpkgs bumped nixos-render-docs and dropped --toc-depth,
  # which the pinned nix-darwin manual builder still passes. Skip the
  # manual build instead of pinning; drop this once nix-darwin catches up.
  documentation.enable = false;

  # darwin-uninstaller builds its own separate minimal nix-darwin eval
  # (default config, documentation.enable=true) to embed an uninstall
  # script, hitting the same broken manual build regardless of the
  # setting above. See github.com/nix-darwin/nix-darwin/issues/1817.
  system.tools.darwin-uninstaller.enable = false;
}
