set CFG ~/.config/fish/config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set DOOMDIR "$HOME/.doom.d"
set GOPATH "$HOME/go"
set GOBIN "$GOPATH/bin"
set GOPROXY "https://goproxy.io,direct"
set NNN_BMS "r:$HOME/Programming/ruby;h:$HOME;p:$HOME/Programming;i:$HOME/Library/Mobile Documents/com~apple~CloudDocs"
set JAVA_HOME "/usr/local/opt/openjdk@8/"
set -Ux NNN_PLUG 'p:preview-tui;t:preview-tabbed'
set -Ux EDITOR 'nvim'
set -Ux TERMINAL 'tabby'
set -Ux SPLIT "v"
set -Ux REDO_HISTORY_PATH "$HOME"
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
#set -Ux all_proxy "socks5://127.0.0.1:7890"
#set -Ux http_proxy "socks5://127.0.0.1:7890"
#set -Ux https_proxy "socks5://127.0.0.1:7890"

fish_add_path "$HOME/.rbenv/bin"
fish_add_path "/usr/local/bin"
fish_add_path "/usr/local/opt/mysql@5.7/bin"
fish_add_path "/usr/local/opt/elasticsearch@5.6/bin"
fish_add_path "/usr/local/opt/openjdk@8/bin"
fish_add_path "/usr/local/opt/elasticsearch@5.6/bin"
fish_add_path "/usr/local/opt/node@14/bin"
fish_add_path "/usr/local/opt/openjdk/bin"
fish_add_path "$HOME/.emacs.d/bin"
fish_add_path "$HOME/.cargo/bin/"
fish_add_path $GOBIN

eval (starship init fish)
zoxide init fish | source
eval (rbenv init - fish | source)

alias p4 "proxychains4"
alias nv "neovide --multigrid"
alias rgf "rg --files | rg"
alias rgs "rg --fixed-strings --"
alias o "open -a TextEdit"
alias mr "mysql -u root -p"
alias ls "ls -G"
alias rsp "z shopperplus && rails s -p 3000"
alias rcb "z console && rails s -p 3001"
alias rcf "z vuetify && yarn dev"
alias cpp17 "c++ -std=c++17"
# alias nvim "neovide --multigrid"
alias ll "lsd -l"
alias ls "lsd"
alias l "lsd"
alias lzg "lazygit"
alias cat 'bat'

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

    nnn -P p -d $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

# Stupid fig changed this
bind -e \cf
