## tools
tools for quickly prepare OS and dev


# TIPS

## Удобный шелл ZSH
Установка zsh

    sudo apt install zsh
    chsh -s /usr/bin/zsh # шелл по умолчанию
    
### Framework для zsh (oh-my-zsh):
Установка oh-my-zsh

    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Автодополнение строк как в fish:
Установка плагина zsh-autosuggestions для oh-my-zsh

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    
Добавить в файл ~/.oh-my-zsh/custom/zsh-autosuggestion.zsh для стилизации атводополнения

    touch ~/.oh-my-zsh/custom/zsh-autosuggestion.zsh
    echo 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fc5185"' > ~/.oh-my-zsh/custom/zsh-autosuggestion.zsh

### Интерактивный поиск по истории команд
Установка percol для включения интерактивного выбора в консоли

    sudo apt install pip
    sudo pip install percol
    
---
Добавить в файл ~/.zshrc

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

## Bash 
### awk
Вывести количество вхождений каждой записи из 1 колонки файла csv ; если из больше 24

    cat session_log_2dhs.csv| sort | awk -F ';' '{freq[$1]++} END{for (i in freq) if (freq[i]>24) print i, "(" freq[i] ")"}'
