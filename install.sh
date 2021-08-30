#!/bin/bash
# By @HadiDotSh

printf "\e[0;92m- \e[0m\e[1;77mTelegram-Bot\e[0;96m [By @HadiDotSh]\n\e[0m"
mkdir "${HOME}/.telegram-bot"
mv "telegram-bot.sh" "${HOME}/.telegram-bot/telegram-bot.sh"

read -p $'\n\e[0;92m?\e[0m\e[1;77m Telegram Token: \e[0;96m' telegramToken
read -p $'\e[0;92m?\e[0m\e[1;77m Telegram Chat ID: \e[0;96m' telegramChatID

printf 'telegramToken="'"${telegramToken}"'"
telegramChatID="'"${telegramChatID}"'"
last_message_date=""' > ${HOME}/.telegram-bot/config.sh

printf "\n\e[0;92m? \e[0m\e[1;77mInstallation Done. \e[0;92mYou can now add a crontab, your file are located in ${HOME}/.telegram-bot\n\n\e[0m"
