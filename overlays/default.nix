{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.nix-nvim.overlays.default
  ];
}
