# modules/home/programs/noctalia/default.nix
{...}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);
  };
}
