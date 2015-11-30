#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[\033[38;5;9m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;9m\]>\[$(tput sgr0)\]"
#archey3


# Pacman alias examples
alias pacupg="sudo pacman -Syu"     # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl="pacman -Sw"            # Download specified package(s) as .tar.xz ball
alias pac="sudo pacman -S"        # Install specific package(s) from the repositories
alias pacins="sudo pacman -U"       # Install specific package not from the repositories but from a file 
alias pacre="sudo pacman -R"        # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem="sudo pacman -Rns"     # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep="pacman -Si"           # Display information about a given package in the repositories
alias pacreps="pacman -Ss"          # Search for package(s) in the repositories
alias pacloc="pacman -Qi"           # Display information about a given package in the local database
alias paclocs="pacman -Qs"          # Search for package(s) in the local database
alias paclo="pacman -Qdt"           # List all packages which are orphaned
alias pacc="sudo pacman -Scc"       # Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"            # List all files installed by a given package
alias pacown="pacman -Qo"           # Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"   # Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"   # Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd="sudo pacman -Sy && sudo abs"         # Update and refresh the local package and ABS databases against repositories
alias pacinsd="sudo pacman -S --asdeps"            # Install given package(s) as dependencies
alias pacmir="sudo pacman -Syy"                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

#yaourt
alias aup="yaourt -Syu --aur" 
alias yolo="yaourt"
alias yoloupg="yaourt -Syu --aur"
