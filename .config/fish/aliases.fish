function newalias
    if test (count $argv) -eq 2
        echo "alias $argv[1] \"$argv[2]\"" >> ~/.config/fish/aliases.fish
        source ~/.config/fish/aliases.fish
    else
        echo "Usage: newalias ALIAS COMMAND"
    end
end

alias cat "bat"
alias screenshot "maim -u -s | xclip -selection clipboard -t image/png"
alias maim "/usr/bin/maim -u -s | xclip -selection clipboard -t image/png"
alias se "SUDO_EDITOR=nvim sudoedit"
alias v "nvim"
