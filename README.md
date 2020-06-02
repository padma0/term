## My Terminal Configs

### Usage

#### 0. iterm2
1. install [iterm2](https://www.iterm2.com/)
2. install powerline
```
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```
3. clone this repo
```
git clone https://github.com/padma0/term
```
4. install profile configs:
Preference -> Profiles -> Other Actions... -> Import JSON Profiles
```
  iterm2-default.json
  iterm2-hotkey.json
```
#### 1. [oh-my-zsh](https://ohmyz.sh)
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```
# zsh configs
cp .zshrc ~/.zshrc
```
#### 2. zsh theme
```
# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install node
npm install --global pure-prompt
```
#### 3. some useful tools
```
# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install
# tig
brew install tig
# hub
brew install hub
# git-extras
brew install git-extras
# autojump
brew install autojump
```
