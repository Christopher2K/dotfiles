export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export NVIM_CONFIG="$HOME/.config/nvim/init.lua"

## CUSTOM VARS
export DEV="$HOME/Developer"
#
## HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

## NODE VERSION MANAGER
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

## GO
export PATH="$PATH:$HOME/go/bin"

## JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home" # OPEN JDK 11

## ANDROID
export ANDROID_ROOT="$HOME/Library/Android"
export ANDROID_SDK_ROOT="$ANDROID_ROOT/sdk"
export ANDROID_PLATFORM_TOOLS="$ANDROID_SDK_ROOT/platform-tools"
export PATH="$PATH:$ANDROID_PLATFORM_TOOLS"

## Flutter
export PATH="$PATH:$DEV_RESOURCES/flutter/bin"
export CHROME_EXECUTABLE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"

## HOMEBREW CONFIG
export HOMEBREW_NO_AUTO_UPDATE=1

# RUBY
eval "$(rbenv init - zsh)"
export RBENV_VERSION=3.1.1

# DOTFILES REPOSITORY
export DOTFILES_REPOSITORY=$HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias x86="arch -x86_64 $SHELL"


# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
