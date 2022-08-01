set cfg $HOME/.config/fish/config.fish

zoxide init fish | source

fish_add_path $HOME/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path /usr/bin
fish_add_path $HOME/.emacs.d/bin

starship init fish | source

status --is-interactive; and rbenv init - fish | source

set -Ux GOPATH $HOME/go
set -Ux GOBIN $GOPATH/bin

fish_add_path $GOPATH
fish_add_path $GOBIN
fish_add_path /usr/sbin

alias nv "neovide --multigrid"
alias ls "lsd"
alias ll "lsd -l"
alias la "lsd -a"
alias tldr "tldr -t ocean"

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# nnn cd on quit
# https://github.com/jarun/nnn/blob/master/misc/quitcd/quitcd.fish
function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "-x" from both lines below,
    # without changing the paths.
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -d $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

