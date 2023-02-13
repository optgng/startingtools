#!/bin/bash

tgApp=/opt/goinfre/teodorai/Telegram.app
dirbrw=/opt/goinfre/teodorai/homebrew
dirwget=/opt/goinfre/teodorai/homebrew/Cellar/wget

if [ ! -e $dirbrw ]
then
  echo -e "\033[34mThere is no brew, please install that..."
  exit 1
fi

if [ ! -e $dirwget ]
then
  echo -e "\033[34mInstalling wget..."
  brsw
  brew install wget
else 
  echo -e "\033[34mwget have been installed..."
fi

if [ ! -e $tgApp ]
then
  echo -e "\033[34mInstalling telegram..."
  if [ ! -e $dirwget ]
  then
    echo -e "\033[34mThere is no wget, please install that..."
    exit 1
  fi
  wget https://telegram.org/dl/desktop/mac -O ~/Downloads/telega.dmg
  hdiutil attach ~/Downloads/telega.dmg -quiet -mountpoint ~/goinfre/tg
  cd goinfre/tg && cp -r Telegram.app ../
  cd ../ && hdiutil detach -quiet ~/goinfre/tg
  rm -rf ~/Downloads/telega.dmg
  echo -e "\033[34mInstall completed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
else
  echo -e "\033[34mTelegram have been installed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
fi