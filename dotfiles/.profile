# shellcheck disable=SC1090,SC1091

# Aliases / Functions / Exports
if [ -f "$XDG_CONFIG_HOME/shell/exports" ]; then
  . "$XDG_CONFIG_HOME/shell/exports"
fi
if [ -f "$XDG_CONFIG_HOME/shell/aliases" ]; then
  . "$XDG_CONFIG_HOME/shell/aliases"
fi
if [ -f "$XDG_CONFIG_HOME/shell/functions" ]; then
  . "$XDG_CONFIG_HOME/shell/functions"
fi

### Bash / ZSH
if [ "$BASH_SUPPORT" = 'true' ]; then
  ### OS Detection
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = 'alpine' ]; then
      OS_ICON=""
    elif [ "$ID" = 'arch' ]; then
      OS_ICON=""
    elif [ "$ID" = 'centos' ]; then
      OS_ICON=""
    elif [ "$ID" = 'coreos' ]; then
      OS_ICON=""
    elif [ "$ID" = 'debian' ]; then
      OS_ICON=""
    elif [ "$ID" = 'deepin' ]; then
      OS_ICON=""
    elif [ "$ID" = 'elementary' ]; then
      OS_ICON=""
    elif [ "$ID" = 'endeavour' ]; then
      OS_ICON=""
    elif [ "$ID" = 'freebsd' ]; then
      OS_ICON=""
    elif [ "$ID" = 'gentoo' ]; then
      OS_ICON=""
    elif [ "$ID" = 'kali' ]; then
      OS_ICON=""
    elif [ "$ID" = 'linuxmint' ]; then
      OS_ICON=""
    elif [ "$ID" = 'manjaro' ]; then
      OS_ICON=""
    elif [ "$ID" = 'nixos' ]; then
      OS_ICON=""
    elif [ "$ID" = 'openbsd' ]; then
      OS_ICON=""
    elif [ "$ID" = 'opensuse' ]; then
      OS_ICON=""
    elif [ "$ID" = 'parrot' ]; then
      OS_ICON=""
    elif [ "$ID" = 'pop_os' ]; then
      OS_ICON=""
    elif [ "$ID" = 'raspberry_pi' ]; then
      OS_ICON=""
    elif [ "$ID" = 'redhat' ]; then
      OS_ICON=""
    elif [ "$ID" = 'fedora' ]; then
      OS_ICON=""
    elif [ "$ID" = 'ubuntu' ]; then
      OS_ICON=""
    else
      OS_ICON=""
    fi
  else
    if [ -d /Applications ] && [ -d /Library ] && [ -d /System ]; then
      # macOS
      OS_ICON=""
    else
      OS_ICON=""
    fi
  fi

  ### ASDF
  if [ -f "$ASDF_DIR/asdf.sh" ]; then
    . "$ASDF_DIR/asdf.sh"
  fi
fi

### Colorize
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto'

### Aliases (better defaults for simple commands)
alias cp='cp -v'
alias rm='rm -I'
alias mv='mv -iv'
alias ln='ln -sriv'
alias xclip='xclip -selection c'
command -v vim > /dev/null && alias vi='vim'

### TOP - order based on preference of "top" application (last item will always be chosen if installed, e.g. glances)
command -v htop > /dev/null && alias top='htop'
command -v gotop > /dev/null && alias top='gotop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
command -v ytop > /dev/null && alias top='ytop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
command -v btm > /dev/null && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'
# themes for light/dark color-schemes inside ~/.config/bashtop; Press ESC to open the menu and change the theme
command -v bashtop > /dev/null && alias top='bashtop'
command -v bpytop > /dev/null && alias top='bpytop'
command -v glances > /dev/null && alias top='glances'

### Cargo
if [ -f "$CARGO_HOME/env" ]; then
  . "$CARGO_HOME/env"
fi

### SDKMan
if command -v brew > /dev/null && command -v sdkman-cli > /dev/null; then
  export SDKMAN_DIR="$(brew --prefix sdkman-cli)/libexec"
  . "$SDKMAN_DIR/bin/sdkman-init.sh"
elif [ -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
  export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
  . "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
