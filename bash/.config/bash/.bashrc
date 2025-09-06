source ~/scripts/lib/term-cfns
source $HOME/.local/lib/umacros
source $HOME/.config/bash/prompt

# =====================================================
# Bash vi mode
# =====================================================
set -o vi



# =====================================================
# FZF bash
# =====================================================
eval "$(fzf --bash)"
  
fzfMenu

export FZF_COMPLETION_TRIGGER='*'
export FZF_COMPLETION_OPTS="--height 15 --layout reverse --border sharp --pointer '▶' --marker '▶ ' --prompt \"$fzfNormalPrompt\" --bind=\"$allFzfBinds\" --color prompt:7"



# =====================================================
# Aliases
# =====================================================
source $HOME/.config/bash/aliases



# =====================================================
# ENV VARS
# =====================================================
export PATH="$PATH:$HOME/go/bin:$HOME/.local/bin:$HOME/scripts:$HOME/.cargo/bin:$HOME/bin:$HOME/git/termux-bin"

export MANPAGER="nvim +Man!"
export EDITOR="nvim"

# Timezone
export TZ=Africa/Cairo



# =====================================================
# Autostart tmux upon launch
# =====================================================
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # Grab all unnamed detached sessions and kill them
    detached_tmux=$( tmux list-sessions -F '#{session_name} #{session_attached} #{session_id}' |\
        awk '/^[0-9]* 0/{print $3}')
    if [ -n "$detached_tmux" ]; then
		echo $detached_tmux | xargs -n 1 tmux kill-session -t 
	fi
  	exec tmux -u
fi



# =====================================================
# Eternal bash history.
# =====================================================
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
# =====================================================
export HISTFILESIZE=9999999
export HISTSIZE=9999999
export HISTTIMEFORMAT="[%F %T] "
export HISTCONTROL=ignoreboth:erasedups

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE="$HOME/data/.bash_eternal_history"

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Starship
# eval "$(starship init bash)"
