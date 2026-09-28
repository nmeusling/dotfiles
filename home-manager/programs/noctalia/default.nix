# modules/home/programs/noctalia/default.nix
{...}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings =
      (builtins.fromTOML (builtins.readFile ./noctalia-config.toml))
      // {
        wallpaper = {
          directory = "${../../../backgrounds}";
          default.path = "${../../../backgrounds/wallhaven-39ykq6_3840x2160.jpg}";
        };
      };
  };
}
