# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# iTerm2
brew install --cask iterm2

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/.dotfiles/.zshrc ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
cp ~/.dotfiles/.p10k.zsh ~

# z
brew install z

# jq
brew install jq

# ack
brew install ack

# tree
brew install tree

# direnv
brew install direnv

# htop
brew install htop

# fzf
brew install fzf

# bat
brew install bat

# asdf
brew install asdf

    # Node.js (latest)
    asdf plugin add nodejs
    asdf install nodejs latest
    asdf list nodejs | tail -1 | xargs echo "nodejs$1" >> ~/.tool-versions

    # Golang (latest)
    asdf plugin add golang
    asdf install golang latest
    asdf list golang | tail -1 | xargs echo "golang$1" >> ~/.tool-versions

    # Java (latest)
    asdf plugin add java
    asdf install java latest:openjdk
    asdf list java | tail -1 | xargs echo "java$1" >> ~/.tool-versions

    # Python (latest)
    asdf plugin add python
    asdf install python latest
    asdf list python | tail -1 | xargs echo "python$1" >> ~/.tool-versions

    # Rust (latest)
    asdf plugin add rust
    asdf install rust latest
    asdf list rust | tail -1 | xargs echo "rust$1" >> ~/.tool-versions

# IntelliJ HTTP Client CLI
brew install ijhttp

# Jupyter Notebook
brew install jupyterlab

# Docker
brew install --cask docker

# AWS CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# Kubernetes
brew install kubernetes-cli k9s
