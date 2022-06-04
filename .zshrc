# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/christopher/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export NVIM_CONFIG="$HOME/.config/nvim/init.lua"


## CUSTOM VARS
export DEV="$HOME/Dev"
export DEV_RESOURCES="$DEV/RESOURCES"
export CONCENTRATION="$DEV/MOBILE_APP/concentration"
export PLAYTHELIST="$DEV/PLAYTHELIST"

## HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

## NODE VERSION MANAGER
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

## GO
export PATH="$PATH:/Users/christopher/go/bin"

## JAVA
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home" # OPEN JDK 11

## ANDROID
export ANDROID_ROOT="/Users/christopher/Library/Android"
export ANDROID_SDK_ROOT="$ANDROID_ROOT/sdk"
export ANDROID_PLATFORM_TOOLS="$ANDROID_SDK_ROOT/platform-tools"
export PATH="$PATH:$ANDROID_PLATFORM_TOOLS"

## Flutter
export PATH="$PATH:$DEV_RESOURCES/flutter/bin"
export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

## HOMEBREW CONFIG
export HOMEBREW_NO_AUTO_UPDATE=1

# RUBY
eval "$(rbenv init - zsh)"
export RBENV_VERSION=3.1.1

# DOTFILES REPOSITORY
export DOTFILES_REPOSITORY=$HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

