PROMPT="%F{magenta}%c%f %(?:%F{blue}» :%F{red}» )%f" 
RPROMPT="%F{yellow}%D{%H:%M:%S}%f"

TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
