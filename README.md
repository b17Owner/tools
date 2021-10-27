## tools
tools for quickly prepare OS and dev


# TIPS

### удобный шелл
    apt install zsh

### интерактивный выбор с клавиатуры в консоле
    sudo pip install percol

### framework для zsh (oh-my-zsh)
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Добавить в .zshrc для интерактивного выбора из истории
#### zsh-history-search

    function exists { which $1 &> /dev/null }

    if exists percol; then
        function percol_select_history() {
            local tac
            exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
            BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
            CURSOR=$#BUFFER         # move cursor
            zle -R -c               # refresh
        }

        zle -N percol_select_history
        bindkey '^R' percol_select_history
    fi

### Добавить в .zshrc для отображения текущей даты и времени справа экрана
    RPROMPT="[%D{%f/%m/%Y}|%@]"
