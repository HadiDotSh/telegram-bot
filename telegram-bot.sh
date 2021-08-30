#! /bin/bash
# By @HadiDotSh
CONFIG_FILE="${HOME}/.telegram-bot/config.sh"

get_last_message(){
    REQUEST=$(curl -s "https://api.telegram.org/bot${telegramToken}/getUpdates?chat_id=${telegramChatID}" | sed 's/,/\n/g' | grep "text" | tail -1 | sed 's/"text":"//;s/"}}]}//')

    # Modify here your commands
    if [[ "${REQUEST}" == "ping" ]];then
        send_message "🏓 <b>Pong</b>"

    elif [[ "${REQUEST}" == "date" ]];then
        send_message "$(date)"
    fi
}

send_message(){
    message=$( echo "${1}" | sed 's/\\n/%0A/g' )
    curl -s -o /dev/null "https://api.telegram.org/bot${telegramToken}/sendMessage?chat_id=${telegramChatID}&parse_mode=HTML&text=${message}"
}

source "${CONFIG_FILE}"
message_date=$(curl -s "https://api.telegram.org/bot${telegramToken}/getUpdates?chat_id=${telegramChatID}" | sed 's/,/\n/g' | grep '"date":' | tail -1 | sed 's/"date"://;s/"}}]}//')

if [[ "${message_date}" == "${last_message_date}" ]];then
    exit
else
    message_date_update=$( cat ${CONFIG_FILE} | sed "s/^last_message_date=\".*/last_message_date=\"${message_date}\"/")
    echo "${message_date_update}" > "/tmp/message_date_updated"
    mv "/tmp/message_date_updated" "${CONFIG_FILE}"
    get_last_message
fi