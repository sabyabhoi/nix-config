{
  inputs,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      pane_frames = false;
      show_startup_tips = false;
      plugins = {
        about._props.location = "zellij:about";
        autolock = {
          _props.location = "file:/home/sabyabhoi/.config/zellij/plugins/zellij-autolock.wasm";
          is_enabled = true;
          print_to_log = true;
          reaction_seconds = "0.3";
          triggers = "nvim|vim|git|fzf|zoxide|atuin";
        };
        compact-bar._props.location = "zellij:compact-bar";
        configuration._props.location = "zellij:configuration";
        filepicker = {
          _props.location = "zellij:strider";
          cwd = "/";
        };
        plugin-manager._props.location = "zellij:plugin-manager";
        session-manager._props.location = "zellij:session-manager";
        status-bar._props.location = "zellij:status-bar";
        strider._props.location = "zellij:strider";
        tab-bar._props.location = "zellij:tab-bar";
        welcome-screen = {
          _props.location = "zellij:session-manager";
          welcome_screen = true;
        };
      };
    };
    extraConfig = ''
      load_plugins {
        autolock
      }
    '';
  };
}
