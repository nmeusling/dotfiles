{
  imports = [
    ./niri.nix
    ./vscode.nix
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      shell = {
        font_family = "JetBrainsMono Nerd Font";
      };

      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      bar.main = {
        position = "top";
        start = ["launcher" "wallpaper" "workspaces"];
        center = ["clock"];
        end = ["media" "tray" "notifications" "clipboard" "network" "volume" "brightness" "battery" "control-center" "session"];
      };
    };
  };
}
