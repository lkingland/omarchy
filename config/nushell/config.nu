# config.nu - Nushell configuration
#
# Nushell quick reference:
# - `help commands` - list all commands
# - `help <command>` - get help for a specific command
# - `$env` - view environment variables
# - `config nu` - edit this file
# - Pipelines work like unix but pass structured data, not text

# -------------------------
# Settings
# -------------------------
$env.config = {
    show_banner: false
    edit_mode: vi

    cursor_shape: {
        vi_insert: line
        vi_normal: block
    }

    history: {
        max_size: 10000000
        sync_on_enter: true
        file_format: "sqlite"
    }

    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
    }

    # Onsen color config - muted colors for data, colors only for actionable items
    color_config: {
        separator: "#606060"
        leading_trailing_space_bg: { attr: n }
        header: { fg: "#E0E0E0", attr: b }
        row_index: "#606060"
        record: "#E0E0E0"
        list: "#E0E0E0"
        bool: "#8FD9A8"
        int: "#B0B0B0"
        float: "#B0B0B0"
        filesize: "#B0B0B0"
        duration: "#B0B0B0"
        date: "#B0B0B0"
        datetime: "#B0B0B0"
        range: "#B0B0B0"
        string: "#E0E0E0"
        nothing: "#606060"
        binary: "#B0B0B0"
        cellpath: "#A8C4F7"
        hints: "#606060"
        shape_binary: "#B0B0B0"
        shape_block: "#A8C4F7"
        shape_bool: "#8FD9A8"
        shape_datetime: "#B0B0B0"
        shape_directory: "#A8C4F7"
        shape_external: "#8FD9A8"
        shape_filepath: "#E0E0E0"
        shape_flag: "#A8C4F7"
        shape_float: "#B0B0B0"
        shape_int: "#B0B0B0"
        shape_list: "#E0E0E0"
        shape_literal: "#8FD9A8"
        shape_nothing: "#606060"
        shape_operator: "#E0E0E0"
        shape_range: "#B0B0B0"
        shape_record: "#E0E0E0"
        shape_string: "#E0E0E0"
        shape_variable: "#8FD9A8"
    }

    keybindings: [
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
    ]
}

# Vi mode indicators (starship character disabled, nushell handles it)
let green_bold = { fg: "#8FD9A8", attr: b }
let blue_bold = { fg: "#A8C4F7", attr: b }
$env.PROMPT_INDICATOR_VI_INSERT = $"(ansi $green_bold)❯(ansi reset) "
$env.PROMPT_INDICATOR_VI_NORMAL = $"(ansi $blue_bold)❮(ansi reset) "

# -------------------------
# Environment
# -------------------------

# Add local bin directories to PATH
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/share/omarchy/bin")
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")
$env.PATH = ($env.PATH | prepend $"($env.HOME)/go/bin")
$env.PATH = ($env.PATH | prepend $"($env.HOME)/sh")

# Java (use `sudo archlinux-java set java-21-openjdk` for Android)
$env.JAVA_HOME = "/usr/lib/jvm/default"

# Android SDK
$env.ANDROID_HOME = $"($env.HOME)/Android/Sdk"
$env.ANDROID_SDK_ROOT = $env.ANDROID_HOME
$env.PATH = ($env.PATH | append $"($env.ANDROID_HOME)/platform-tools")
$env.PATH = ($env.PATH | append $"($env.ANDROID_HOME)/cmdline-tools/latest/bin")
$env.PATH = ($env.PATH | append $"($env.ANDROID_HOME)/emulator")
$env.PATH = ($env.PATH | append $"($env.ANDROID_HOME)/build-tools/34.0.0")

$env.EDITOR = "nvim"

# LS_COLORS for nushell native ls and eza (Onsen theme)
# Blue=structure, White=text, Green=binary, Orange=executable
$env.LS_COLORS = ([
    "di=1;38;2;168;196;247"       # directories: bold blue
    "ln=38;2;168;196;247"         # symlinks: blue
    "ex=38;2;255;158;80"          # executables: orange
    "fi=38;2;224;224;224"         # regular files: white
    "pi=38;2;96;96;96"            # pipes: grey
    "so=38;2;96;96;96"            # sockets: grey
    "bd=38;2;255;158;80"          # block devices: orange
    "cd=38;2;255;158;80"          # char devices: orange
    "or=38;2;255;107;107"         # orphan (broken symlink): red
    "mi=38;2;255;107;107"         # missing file: red
    "su=38;2;255;107;107"         # setuid: red
    "sg=38;2;255;158;80"          # setgid: orange
    "tw=1;38;2;168;196;247"       # sticky other-writable: bold blue
    "ow=38;2;168;196;247"         # other-writable: blue
    # Binary files: green
    "*.png=38;2;143;217;168"
    "*.jpg=38;2;143;217;168"
    "*.jpeg=38;2;143;217;168"
    "*.gif=38;2;143;217;168"
    "*.webp=38;2;143;217;168"
    "*.svg=38;2;143;217;168"
    "*.ico=38;2;143;217;168"
    "*.mp4=38;2;143;217;168"
    "*.mkv=38;2;143;217;168"
    "*.avi=38;2;143;217;168"
    "*.mov=38;2;143;217;168"
    "*.webm=38;2;143;217;168"
    "*.mp3=38;2;143;217;168"
    "*.flac=38;2;143;217;168"
    "*.wav=38;2;143;217;168"
    "*.ogg=38;2;143;217;168"
    "*.zip=38;2;143;217;168"
    "*.tar=38;2;143;217;168"
    "*.gz=38;2;143;217;168"
    "*.xz=38;2;143;217;168"
    "*.7z=38;2;143;217;168"
    "*.rar=38;2;143;217;168"
    "*.pdf=38;2;143;217;168"
    "*.o=38;2;143;217;168"
    "*.so=38;2;143;217;168"
    "*.a=38;2;143;217;168"
    # Temp files: dark grey
    "*.tmp=38;2;96;96;96"
    "*.swp=38;2;96;96;96"
    "*.bak=38;2;96;96;96"
] | str join ":")

# GPG agent for SSH authentication (YubiKey)
# smartsocket proxies to remote or local agent automatically
$env.GPG_TTY = (tty)
$env.SSH_AUTH_SOCK = "/run/user/1000/gnupg/S.gpg-agent.ssh"
gpgconf --launch gpg-agent
$env.VISUAL = "nvim"
$env.SUDO_EDITOR = "nvim"
$env.GIT_EXTERNAL_DIFF = "difft"
$env.DFT_UNDERLINE = "false"
$env.BAT_THEME = "onsen"
$env.EZA_CONFIG_DIR = $"($env.HOME)/.config/omarchy/current/theme"
$env.TIME_STYLE = "+%Y/%m/%d %H:%M"

# -------------------------
# Aliases - General
# -------------------------
alias c = clear
alias e = exit
alias v = nvim
alias s = sudo
alias d = docker
alias g = git
alias k = kubectl

# Create directory and cd into it
def cx [dir: string] {
    mkdir $dir
    cd $dir
}

# Nvim with directory default (like Omarchy's n function)
def n [...args: string] {
    if ($args | is-empty) {
        nvim .
    } else {
        nvim ...$args
    }
}

# Open file/URL in background (xdg-open wrapper)
def open [path: string] {
    xdg-open $path out+err> /dev/null &
}

# Directory stack (pushd/popd style navigation)
$env.DIR_STACK = []

# cd wrapper that pushes current dir onto stack before changing
def --env cdd [dir?: string] {
    let target = if ($dir | is-empty) { $env.HOME } else { $dir }
    $env.DIR_STACK = ($env.DIR_STACK | prepend $env.PWD)
    cd $target
}

# Pop directory from stack and cd to it
def --env o [] {
    if ($env.DIR_STACK | is-empty) {
        print "Directory stack is empty"
    } else {
        let target = ($env.DIR_STACK | first)
        $env.DIR_STACK = ($env.DIR_STACK | skip 1)
        cd $target
    }
}

# Show the directory stack
def dirs [] {
    $env.DIR_STACK | enumerate | each { |it| $"($it.index): ($it.item)" }
}

# Directory navigation shortcuts
alias '..' = cd ..
alias '...' = cd ../..
alias '....' = cd ../../..

# -------------------------
# Aliases - ls variants
# -------------------------
# Eza (compact, readable output)
alias l = eza -l --icons --git
alias ll = eza -la --icons --git
alias lla = eza -la --icons --git
alias la = eza -a --icons

# Eza tree variants
alias lt = eza --tree --level=2 --long --icons --git
alias lta = eza --tree --level=2 --long --icons --git -a
alias ltree = eza --tree --level=2 --icons --git
alias ltt = eza --tree --level=4 --icons --git --only-dirs

# Nushell native ls (for structured data / piping with | where, etc.)
# Use `ls` directly for native output
alias lsa = ls -a

# Fuzzy finder with bat preview
def ff [...args: string] {
    if ($args | is-empty) {
        fzf --preview 'bat --color=always {}'
    } else {
        fzf --preview 'bat --color=always {}' ...$args
    }
}

# -------------------------
# Aliases - Git
# -------------------------
alias ga = git add
alias gb = git branch
alias gba = do { git fetch -ap; git branch -a }
alias gc = git commit
alias gca = git commit -a
alias gco = git checkout
alias gd = git diff
alias gp = git pull
alias gr = git remote -v
alias gs = git status -sb
alias gt = git tag --sort=version:refname
alias gtd = git tag --delete
alias gu = git push

# Git commit shortcuts (from Omarchy)
def gcm [message: string] { git commit -m $message }
def gcam [message: string] { git commit -a -m $message }
def gcad [] { git commit -a --amend }

# Git log - compact format
def gl [n: int = 10] {
    git log -n $n --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
}

# Git log - all commits
def gll [] {
    git log --graph --pretty=format:"%Cgreen%h%Creset %an: %s %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset" --abbrev-commit --date=relative
}

# Git log - fancy topo-ordered (from fish)
def glog [] {
    git log --graph --topo-order --pretty=format:"%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N" --abbrev-commit
}

# Difftastic aliases (fancy structural diffs)
def dl [...args: string] { git log -p --ext-diff ...$args }
def ds [...args: string] { git show --ext-diff ...$args }
def dt [...args: string] { git diff --ext-diff ...$args }

# -------------------------
# Aliases - Systemd
# -------------------------
alias sc = systemctl
alias scu = systemctl --user
alias jc = journalctl --output=cat
alias jcu = journalctl --output=cat --user

# -------------------------
# Aliases - Wayland clipboard
# -------------------------
alias copy = wl-copy
alias paste = wl-paste

# -------------------------
# Jujutsu VCS
# -------------------------
def jll [] {
    jj log -r '@ | ancestors(remote_bookmarks().., 2) | trunk()'
}

# -------------------------
# Bitwarden (session management)
# -------------------------
def bw-unlock [] {
    ^bw unlock --raw | save -f ~/.bw-session
}

def bww [...args: string] {
    let session = (open ~/.bw-session | str trim)
    ^bw --session $session ...$args
}

# -------------------------
# Utility Functions
# -------------------------

# Compression utilities (from Omarchy)
def compress [dir: string] {
    let name = ($dir | path basename)
    tar -czvf $"($name).tar.gz" $dir
}

def decompress [file: string] {
    tar -xzvf $file
}

# Media transcoding (from Omarchy)
def transcode-video-1080p [input: string, output: string] {
    ffmpeg -i $input -vf "scale=1920:1080" -c:v libx264 -crf 23 -c:a aac -b:a 128k $output
}

def transcode-video-4K [input: string, output: string] {
    ffmpeg -i $input -vf "scale=3840:2160" -c:v libx265 -crf 28 -c:a aac -b:a 192k $output
}

def img2jpg [input: string, output: string] {
    magick $input -quality 85 $output
}

def img2jpg-small [input: string, output: string] {
    magick $input -resize "1920x1080>" -quality 75 $output
}

def img2png [input: string, output: string] {
    magick $input -compress lossless $output
}

# ISO to SD card utility
def iso2sd [iso: string, device: string] {
    print $"WARNING: This will overwrite ($device)!"
    print "Press Ctrl+C to cancel, or wait 5 seconds to continue..."
    sleep 5sec
    sudo dd if=$iso of=$device bs=4M status=progress oflag=sync
}

# -------------------------
# Integrations
# -------------------------

# Mise (version manager) - CRITICAL for managing tool versions
# Regenerate with: mise activate nu | save -f ~/.cache/mise.nu
source ~/.cache/mise.nu

# Zoxide (smart cd) - use 'z' to jump to directories
source ~/.cache/zoxide.nu

# Starship prompt
source ~/.cache/starship.nu

# Carapace completions (rich completions for 1000+ commands)
source $"($nu.cache-dir)/carapace.nu"

# Atuin (fish-style history with fuzzy search)
# Ctrl+R for fuzzy search, deduplication, shared history
source ~/.cache/atuin.nu
