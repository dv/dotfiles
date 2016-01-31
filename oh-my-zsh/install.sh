if [ ! -d "~/.oh-my-zsh" ]; then
  echo "  Installing oh-my-zsh for you."

  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
