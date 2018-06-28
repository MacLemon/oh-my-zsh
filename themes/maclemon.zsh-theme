# MacLemon theme
# preview: 

# Inspired by Powerline
# Doe not use patched fonts but needs UTF-8 Unicode support.


# features:
# path is autoshortened to ~30 characters
# displays git status (if applicable in current folder)
# turns username red if superuser, otherwise it is yellow.


# global color definitions
FOREGROUNDCOLOR="green"
BACKGROUNDCOLOR="black"
ALERTCOLOR="red"

HOSTNAMECOLOR="yellow"
HOSTNAMEBACKGROUND=$BACKGROUNDCOLOR

USERNAMECOLOR="yellow"
USERNAMEBACKGROUND=$BACKGROUNDCOLOR

# For !#%
PROMPTCOLOR=$FOREGROUNDCOLOR
PROMPTBACKGROUND=$BACKGROUNDCOLOR
# For returnvalues <> 0
ALERTPROMPTCOLOR=$ALERTCOLOR
ALERTPROMPTBACKGROUND=$BACKGROUNDCOLOR

# PATH parts
PATHCOLOR=$FOREGROUNDCOLOR
PATHBACKGROUND=$BACKGROUNDCOLOR

# Repository Colors
REPOCOLOR="white"
REPOBACKGROUND=$BACKGROUNDCOLOR



if [ $? -eq 0 ]; then
    PROMPTCOLOR="$ALERTCOLORCOLOR"
    PROMPTBACKGROUND=$BACKGROUNDCOLOR
fi



# if superuser color things differently
if [ $UID -eq 0 ]; then

    # username in white on red
    USERNAMECOLOR="white"
    USERNAMEBACKGROUND="red"

fi

# From
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
#

# Tags git ± and mercurial ☿ repositories. Also marks a detached HEAD in a git repo.
function repository_badge {
    git branch >/dev/null 2>/dev/null && echo -n '±' && git status 2>/dev/null | grep -q "HEAD detached" && echo -n "💥" && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
}

# marks availability of a sudo ticket.
function sudoticket {
    sudo -n true &>/dev/null && echo -n '¯' && return
    echo ' ' && return
}


# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[gray]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[gray]%}%{$fg[$REPOCOLOR]%}%{$bg[$REPOBACKGROUND]%})"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✱"


# %{$reset_color%}


# prompt
PROMPT='%{$fg[$USERNAMECOLOR]%}%{$bg[$USERNAMEBACKGROUND]%}%n%{$fg[$HOSTNAMECOLOR]%}%{$bg[$HOSTNAMEBACKGROUND]%}@%m:%{$fg[$PATHCOLOR]%}%{$bg[$PATHBACKGROUND]%}${PWD/#$HOME/~}%{$fg[$REPOCOLOR]%}%{$bg[$REPOBACKGROUND]%} $(repository_badge)$(git_prompt_info)%{$reset_color%}%(?.%{$fg[$PROMPTCOLOR]%}%{$bg[$PROMPTBACKGROUND]%}.%{$fg[$ALERTPROMPTCOLOR]%}%{$bg[$ALERTPROMPTBACKGROUND]%?%})%(!.#.$)%{$reset_color%}$(sudoticket)'

# Righthand side prompt with a few little easter eggs. :-)
RPROMPT='%(9D.%(31d.🎃.).)%(2D.%(17d.🍀.).)%(4D.%(5d.🎏.).)%(6D.%(w5.%(d25😈..)%(d26😈..)%(d27😈..)%(d28😈..)%(d29😈..)%(d30😈..)%(d31😈..).).)%(7D.%(8d.😺.).)%(D11.%(d31.🎆.).)%(D0.%(d1.🎇.).)%(D1.%(d14.💝.).)%(D8.%(d29☕..).)%(7D.%(w5.%(d1🍺..)%(d2🍺..)%(d3🍺..)%(d4🍺..)%(d5🍺..)%(d6🍺..)%(d7🍺..).).)%(D6.%(d13.🍫.).)%(D5.%(d27.😎.).)%(D2.%(d14.π.).)%(D5.%(d28.τ.).)'

