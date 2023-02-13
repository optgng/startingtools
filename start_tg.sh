#!/bin/bash

NameUser=$(id -un)
tgApp=/opt/goinfre/$NameUser/Telegram.app
dirbrw=/opt/goinfre/$NameUser/homebrew
dirwget=/opt/goinfre/$NameUser/homebrew/Cellar/wget
dirtgdmg=~/Downloads/telega.dmg
dirgoinfretg=~/goinfre/tg

if [ ! -e $dirbrw ]
then
  echo -e "\033[34mThere is no brew, please install that..."
  exit 1
fi

if [ ! -e $dirwget ]
then
  echo -e "\033[34mInstalling wget..."
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
  wget https://telegram.org/dl/desktop/mac -O $dirtgdmg
  hdiutil attach $dirtgdmg -quiet -mountpoint $dirgoinfretg
  cd $dirgoinfretg && cp -r Telegram.app ../
  cd ../ && hdiutil detach -quiet $dirgoinfretg
  rm -rf $dirtgdmg
  echo -e "\033[34mInstall completed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
else
  echo -e "\033[34mTelegram have been installed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
fi