
echo $(pip -V)
echo "source ~./.bash_profile"
source ~/.bash_profile
echo $(pip -V)

if [ -v PYENV_ROOT ]; then
  pip install --upgrade pip
  pip install powerline-shell
  pip install wheel
  pip install icdiff
  pip install ninja
  pip install serial
else
  echo "PYENV_ROOT is not defined"
fi
