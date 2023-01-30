#!/bin/bash

tgApp=/opt/goinfre/teodorai/telega
tgdmg=Downloads/tsetup*.dmg
if [ ! -e $tgdmg ]
then
  echo -e "\033[34mPlease install tgsetup.dmg file..."
  exit 1
fi

if [ ! -e $tgApp ]
then
  echo -e "\033[34mInstalling telegram..."
  cd Downloads
  hdiutil attach tsetup.4.5.3.dmg -quiet -mountpoint ../goinfre/tg
  cd ../goinfre && mkdir temp
  cd tg && cp -r Telegram.app ../temp
  cd ../temp && cp -r Telegram.app ../
  hdiutil unmount -quiet /dev/disk4s1
  cd ../
  rm -rf temp
  cd
  echo -e "\033[34mInstall completed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
else
  echo -e "\033[34mTelegram have been installed!"
  echo -e "\033[34mStarting Telegram App..."
  open -a Telegram
fi