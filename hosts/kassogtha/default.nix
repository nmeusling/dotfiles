{pkgs, ...}: {
  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "${pkgs.swaybg}/bin/swaybg"
          "-m"
          "fill"
          "-o"
          "HDMI-A-1"
          "-i"
          "${../../backgrounds/wallhaven-39ykq6_3840x2160.jpg}"
        ];
      }
    ];
    outputs = {
      "HDMI-A-1" = {
        mode = {
          width = 4096;
          height = 2160;
          refresh = 120.000;
        };
        scale = 2;
      };
    };
  };
}
