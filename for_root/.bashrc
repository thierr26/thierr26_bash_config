# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022
PS1='\[\033[41m\]\[\033[01;32m\]\u\[\033[00m\]:\[\033[00;32m\]\w\[\033[00m\]\$ '

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Find the hook scripts (they are in the user's home directory and have a name
# starting with .bashrc_ and with at least one more character).
HOOK_SCRIPTS=$(find ~ -maxdepth 1 -type f -name ".bashrc_?*");

# Loop over the hook scrupts.
for HOOK in $HOOK_SCRIPTS; do
    if [ -r $HOOK ]; then
        # If the hook script is readable, then source it.
        . $HOOK;
    fi;
done;

# Unset the variables which have been set by the hook scripts mechanism.
unset HOOK_SCRIPTS;
unset HOOK;
