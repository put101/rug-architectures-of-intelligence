{pkgs, ...}: {
  packages = with pkgs; [
    nengo-gui
    python311Packages.nengo
  ];

  languages.python = {
    enable = true;
    venv.enable = true;
  };
}
