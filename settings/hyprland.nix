{
  bind = [
    "$mod, F, exec, firefox"
    "$mod, Q, exec, kitty"
    ", Print, exec, grimblast copy area"
    "$mod, C, killactive"
    "$mod, SPACE, exec, rofi -show drun"
    "$mod, A, fullscreen, 1"
    "$mod, E, exec, thunar"
    "$mod, Z, fullscreen"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod SHIFT, up, movewindow, u"
    "$mod SHIFT, down, movewindow, d"
    "$mod SHIFT, left, movewindow, l"
    "$mod SHIFT, right, movewindow, r"
  ]
  ++ (
    builtins.concatLists(builtins.genList(
      x: let
        ws = let
          c = (x + 1) / 10;
        in builtins.toString(x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString(x+1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString(x+1)}"
      ]
    )
    10)
  );

  bindl = [
    ", XF86AudioMute, exec, pamixer -t"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86AudioStop, exec, playerctl stop"
    ", XF86AudioLowerVolume, exec, pamixer -d 1"
    ", XF86AudioRaiseVolume, exec, pamixer -i 1"
  ];

  bindle = [
    ", XF86AudioLowerVolume, exec, pamixer -d 1"
    ", XF86AudioRaiseVolume, exec, pamixer -i 1"
  ];
}