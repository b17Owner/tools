## tools
tools for quickly prepare OS and dev

# TIPS

## Zsh
### Добавить в .zshrc для отображения текущей даты и времени справа экрана
    RPROMPT="[%D{%f/%m/%Y}|%@]"

## Bash 
### awk
Вывести количество вхождений каждой записи из 1 колонки файла csv ; если из больше 24

    cat session_log_2dhs.csv| sort | awk -F ';' '{freq[$1]++} END{for (i in freq) if (freq[i]>24) print i, "(" freq[i] ")"}'



### must have extensions for gnome
https://extensions.gnome.org/extension/307/dash-to-dock/

https://extensions.gnome.org/extension/3396/color-picker/

https://extensions.gnome.org/extension/1653/tweaks-in-system-menu/

https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/

https://extensions.gnome.org/extension/1112/screenshot-tool/

https://extensions.gnome.org/extension/779/clipboard-indicator/

https://extensions.gnome.org/extension/7/removable-drive-menu/

https://extensions.gnome.org/extension/6/applications-menu/

https://extensions.gnome.org/extension/3780/ddterm/
