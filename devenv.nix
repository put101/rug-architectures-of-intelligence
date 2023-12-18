{pkgs, ...}: {
  packages = with pkgs; [
    python39Packages.numpy
    python39Packages.matplotlib
  ];
  languages.python = {
    enable = true;
    package = pkgs.python39;
    venv.enable = true;
    # poetry.enable = true;
  };
  # Install deps: pip install nengo-gui nengo
}
