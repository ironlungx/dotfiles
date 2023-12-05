alias cat='bat'
alias ccat='/usr/bin/cat'
alias r='source ~/.config/fish/config.fish'
alias clear='clear ; rxfetch'
alias clearr='/usr/bin/clear'
alias ls="exa -l --no-permissions --no-user --no-time -A --group-directories-first"

alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
    rxfetch
end
