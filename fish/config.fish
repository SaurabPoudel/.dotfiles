set fish_greeting
set fish_color_normal brcyan
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param '#04cc85'
set fish_color_autosuggestion '#7d7d7d'

# me lazy
alias c "clear"
alias k "kubectl"
alias x "exit"
alias vi "nvim"
alias vim "nvim"
alias lf "lfimg"
alias cc "clang"
alias cxx "clang++"
alias tf "terraform"
alias unset 'set --erase'

# utils
alias dot "tmux-sessionizer ~/.dotfiles"
alias fetch "neofetch --config ~/.config/neofetch/config.old.conf"
alias scrkey "screenkey -s small --opacity 0.6 -p fixed -g 30%x7%+69%-2%"
alias nodepurge "find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias steam "/home/saurab/.local/share/Steam/steam.sh"
# assume cli
alias ac="source /usr/local/bin/assume.fish -c"
alias at="source /usr/local/bin/assume.fish -t"
alias assume="source /usr/local/bin/assume.fish"

# directory aliases
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias cdd 'cd "$(fd -t d . | fzf)"' # cd with steroids

# better ls
alias ls "exa -a --icons --group-directories-first"
alias ll "exa -lah --icons --no-time --git --group-directories-first"
alias lt "exa -lh --icons --no-user --git -T -L 4 --ignore-glob='.git|node_modules' --group-directories-first --no-permissions --no-filesize --no-time"

# git
alias gd "git diff"
alias gs "git status"
alias ggpush "git push"
alias fuckyou "git push --force"

# docker
alias dps "docker ps"
alias dcd "docker-compose down"
alias dcu "docker-compose up -d"

# Rick
alias rick "curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# TMUX
alias tls  "tmux ls"              # lists currently running sessions
alias ta   "tmux a -t "           # attach to any of running session ( specify session name after this command )
alias tnew "tmux new -s"          # creates new tmux session
alias tkl  "tmux kill-server"     # kills all tmux sessions
alias tk1  "tmux kill-session -t" # kill specific running session ( specify session name after this command )

# nvim distros
alias nvchad "NVIM_APPNAME=NvChad nvim"
alias lazyvim "NVIM_APPNAME=LazyVim nvim"
alias astrovim "NVIM_APPNAME=AstroNvim nvim"

function nvims
    set items LazyVim AstroNvim NvChad
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config > " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    end
    env NVIM_APPNAME=$config nvim $argv
end

# sessionizer script
bind \cf "tmux-sessionizer"

# Path variables
set -x GOPATH /home/saurab/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOBIN
set -x PATH $PATH $HOME/.bun/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.cargo/env
set -x PATH $PATH $HOME/.local/scripts
set -x PATH $PATH $HOME/.local/share/fnm
set -x PATH $PATH /home/saurab/de /dev-tools/flutter/bin
set -x PATH $PATH /home/saurab/dev/dev-tools/android-studio/bin
set -x PATH $PATH /home/saurab/dev/dev-tools/vscode/bin
set -x PATH $PATH $HOME/.local/share/bob/nvim-bin
set -x PATH $PATH $HOME/home/saurab/dev/masm/8086/
set -x ANDROID_HOME /home/saurab/Android/Sdk
set -x PATH $PATH /home/saurab/dev/stripe/
set -x PATH $PATH /home/saurab/wine-dirs/wine-source
set -x PATH $PATH /home/saurab
set -x PATH $PATH /home/saurab/.nvm/versions/node/v20.17.0/bin/npm
set -Ux PATH /home/saurab/.nvm/versions/node/v20.17.0/bin $PATH
set -Ux FG_ROOT $HOME/Downloads/fgdata

#compile and run c++ files
# throw error when unused variable is found
function cxx
    clang++ -Wall -Wextra -Werror -std=c++17 -O2 -o $argv[1] $argv[1].cpp
    ./$argv[1]
end




#pnpm
alias p "pnpm"
alias px "pnpx"
set -gx PNPM_HOME "/home/r3x/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# defaults
export VISUAL="nvim"
export EDITOR="nvim"
export TERM="alacritty"
export KUBECONFIG="$HOME/.kube/config"

fnm env | source
starship init fish | source
