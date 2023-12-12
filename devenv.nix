{pkgs, ...}: {
  languages.python = {
    enable = true;
    package = pkgs.python39;
    venv.enable = true;
  };
  # Install deps: pip install nengo-gui nengo
}
