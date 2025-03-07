zoxide init fish | source

set fish_greeting

alias cd="z"
alias ls="exa -A -l -U --no-permissions --no-user --color=auto --group-directories-first"
source ~/.config/fish/aliases.fish
fzf --fish | source

function starship_transient_prompt_func
  starship module character
end
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
