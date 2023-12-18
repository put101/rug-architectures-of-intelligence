alerady executed: 
```
pyenv versions
pyenv install 3.9
pyenv local 3.9


poetry init
poetry config virtualenvs.in-project true
poetry env use python3.9
poetry add nengo
poetry add nengo-gui

poetry install --no-root
poetry shell
```