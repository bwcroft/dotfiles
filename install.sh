echo "Setting up your Mac..."

# Install Oh-My-ZSH if not already installed
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Install Homebrew if not already installed.
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Setup zsh
rm -rf $HOME/.zshrc
ln -s ./zsh/.zshrc $HOME/.zshrc

# Setup Homebrew
brew update
brew tap homebrew/bundle
brew bundle --file .Brewfile

# Setup nvm
nvm install latest
