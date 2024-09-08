#!/bin/bash
logo() {
echo -e "\033[36m┌──────────────────────────────────────────────────────────────┐";
echo -e "|                           .----.                             |"
echo -e "|                         ...----....                          |"
echo -e "|         .-=-----. .              ......-====-.               |"
echo -e "|        ---=-==---..                ..---==+++=+=             |"
echo -e "|        .      .  ............. ............    .             |"
echo -e "|                      ..-----==-....      .                   |"
echo -e "|                          --..                                |"
echo -e "|                           .                                  |"
echo -e "|              .        .                                      |"
echo -e "|              .                          ..     .             |"
echo -e "|        .        .            .         . .    ..             |"
echo -e "|        ..                    ..     .  .      ..             |"
echo -e "|        .        -   .             .... -.     ...            |"
echo -e "|        .- .    .-..            .- .... =.     .--            |"
echo -e "|        .#= . .----       .. .  .-.-..=.+..    .--            |"
echo -e "|        .+-...=====.      ..  . .-------+== .. -+-            |"
echo -e "|         ---. =+++=.      .--   --=====-+#+. ..=+.            |"
echo -e "|              -#+##-.-.   -=.- =+==+#@#+@#-                   |"
echo -e "|                .-=-......---. +@+=+##==-.                    |"
echo -e "|                          ==-  =+=-.                          |"
echo -e "|                          .-.                                 |"
echo -e "|                                                              |"
echo -e "|                                                              |"
echo -e "│ ▄▄▄▄    ██▓     ▄▄▄       ▄████▄   ██ ▄█▀ ██▓ ▄████▄  ▓█████ │";
echo -e "│▓█████▄ ░██▒    ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██░░██▀ ▀█  ▓█   ▀ │";
echo -e "│▒██▒ ▄██▒██░    ▒██  ▀█▄  ▒▓█    ▄ ░███▄░ ▒██░░▓█    ▄ ▒███   │";
echo -e "│▒██░█▀  ▒██░    ░██▄▄▄▄██ ▒▓▓▄ ▄██░░██ █▄ ░██░░▓▓▄ ▄██▒▒▓█  ▄ │";
echo -e "│░▓█  ▀█▓░██████▒ ▓█   ▓██▒▒ ▓███▀ ░░██▒ █▄░██░▒ ▓███▀ ░░▒████▒│";
echo -e "│░▒▓███▀▒░ ▒░▓  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░▓  ░ ░▒ ▒  ░░░ ▒░ ░│";
echo -e "│▒░▒   ░ ░ ░ ▒  ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ▒ ░  ░  ▒    ░ ░  ░│";
echo -e "│ ░    ░   ░ ░     ░   ▒   ░        ░ ░░ ░  ▒ ░░           ░   │";
echo -e "│ ░          ░  ░      ░  ░░ ░      ░  ░    ░  ░ ░         ░  ░│";
echo -e "│      ░                   ░                   ░               │";
echo -e "|                                                              |"
echo -e "|           \033[0m🐧 \033[1;34mTelegram: \033[2;32mhttps://t.me/los_pinguin\033[0m  🐧          \033[36m|"
echo -e "└──────────────────────────────────────────────────────────────┘\033[0m";
}

clear
logo

# Get a list of existing tmux sessions:
TMUX_SESSIONS_LIST=$(tmux ls | awk -F: '{print $1}')

# If there are no existing sessions:
if [[ -z $TMUX_SESSIONS_LIST ]]; then
    echo " "
    echo "No existing tmux sessions."
    echo "If you want to create a session type your sessio name below"
    echo "To exit from menu press ^C"
    read session_name
    tmux new -s $session_name
else
    # Present a menu to the user:
    echo " "
    echo "Existing tmux sessions:"
    echo "$TMUX_SESSIONS_LIST"
    echo "Enter the name of the session you want to attach to, or 'new' to create a new session: "
    read user_input

    # Attach to the chosen session, or create a new one:
    if [[ $user_input == "new" ]]; then
        echo "Enter name for new session: "
        read new_session_name
        tmux new -s $new_session_name
    else
        tmux attach -t $user_input
    fi
fi
