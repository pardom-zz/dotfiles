# Use neovim as default editor if available
if which vim &> /dev/null; then
  export EDITOR=vim
fi
