{pkgs, ...}: {
  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "${pkgs.swaybg}/bin/swaybg"
          "-m"
          "fill"
          "-o"
          "DP-3"
          "-i"
          "${../../backgrounds/wallhaven-39ykq6_3840x2160.jpg}"
        ];
      }
    ];
    outputs = {
      "DP-3" = {
        mode = {
          width = 3840;
          height = 1600;
          refresh = 59.994;
        };
        scale = 1;
      };
    };
  };
}
