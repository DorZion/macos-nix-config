{pkgs, ...}: {
  # networking.hostName = hostname;
  # networking.computerName = hostname;
  # system.defaults.smb.NetBIOSName = hostname;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."dor" = {
    home = "/Users/dor";
    shell = pkgs.fish;
  };

  nix.settings.trusted-users = ["dor"];
}
