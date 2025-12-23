
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

echo "hi moooooooh" | cowsay | lolcat

# Pure theme
fpath+=($HOME/.zsh/pure)

# Prompts
autoload -U promptinit; promptinit

# Check for git updates
PURE_GIT_PULL=0

# change the path color
# zstyle :prompt:pure:path color white

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

# turn on host and user
zstyle ':prompt:pure:context' show always


prompt pure

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/mo/.dart-cli-completion/zsh-config.zsh ]] && . /home/mo/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export NVM_DIR="$HOME/.nvm"; source /usr/share/nvm/init-nvm.sh
export auraip=194.182.175.77
export ANDROID_HOME=/opt/android-sdk
## export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export CHROME_EXECUTABLE=/opt/google/chrome/chrome










update-all() {
  echo "=========================================="
  echo "🚀 Updating system packages (yay)..."
  echo "=========================================="
  yay

  echo
  echo "=========================================="
  echo "📦 Updating Flatpak packages..."
  echo "=========================================="
  flatpak update

  echo
  echo "=========================================="
  echo "🦀 Updating Cargo packages..."
  echo "=========================================="

  if command -v cargo-install-update &> /dev/null; then
    cargo install-update -a
  else
    echo "cargo-update not found, using fallback..."
    for crate in $(cargo install --list | grep -Eo '^[^ ]+'); do
      echo "Updating $crate..."
      cargo install "$crate" --force
    done
  fi
  
  echo
  echo "=========================================="
  echo "🪄 Updating Flutter SDK..."
  echo "=========================================="
  flutter upgrade

  echo
  echo "=========================================="
  echo "✅ All updates completed!"
  echo "=========================================="
	
}

alias ls=lsd

alias dbuild="docker buildx build"

alias gamesave="cd .local/share/dolphin-emu/"

export PATH="$PATH:$HOME/.cargo/bin:$HOME/.flutter/flutter/bin:$ANDROID_HOME/platform-tools"
alias refreshKubeConf="exo compute sks kubeconfig Test admin > ~/.kube/config"
