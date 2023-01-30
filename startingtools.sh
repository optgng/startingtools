#!/bin/bash

# ---------------------------------------------------------------------
#
# Copyright © 2023  Teodorai
#
# All rights reserved
#
# ----------------------------------------------------------------------*/

# echo -e "\033[31m____  ____  ____  ____  ____  ____  ____  ____ 
# ||t ||||e ||||o ||||d ||||o ||||r ||||a ||||i ||
# ||__||||__||||__||||__||||__||||__||||__||||__||
# |/__\||/__\||/__\||/__\||/__\||/__\||/__\||/__\|"
echo -e "\033[32m\n███████╗████████╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗ ██████╗ 
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝ 
███████╗   ██║   ███████║██████╔╝   ██║   ██║██╔██╗ ██║██║  ███╗
╚════██║   ██║   ██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║██║   ██║
███████║   ██║   ██║  ██║██║  ██║   ██║   ██║██║ ╚████║╚██████╔╝
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝                                                            
"
echo -e "\033[32m████████╗ ██████╗  ██████╗ ██╗     ███████╗
╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
   ██║   ██║   ██║██║   ██║██║     ███████╗
   ██║   ██║   ██║██║   ██║██║     ╚════██║
   ██║   ╚██████╔╝╚██████╔╝███████╗███████║
   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝
                                           "

NameUser=$(id -un)
dirProgBar=.prog_bar
iter=0
dirDockerApp=../../Applications/Docker.app
dirdocker=/opt/goinfre/$NameUser/docker
dirbrew=/opt/goinfre/$NameUser/homebrew
dirlcov=/opt/goinfre/$NameUser/homebrew/Cellar/lcov
dirgcovr=/opt/goinfre/$NameUser/homebrew/Cellar/gcovr

if [ ! -d $dirProgBar ]
then
  git clone -q https://github.com/m-sroka/bash-progress-bar.git $dirProgBar
  cd .prog_bar
  chmod +x progressbar
  cd
fi

echo -e "\033[34mStart inizialization"
echo -e "\033[36mInstalling docker..."
if [ ! -e $dirDockerApp ]
then
  echo -e "\033[31mThere is no Docker app. \nYou should install that in Managed Software Center and run it..."
  exit 1
fi

if [ -d $dirdocker ]
then
  echo -e "\033[35mDocker have been installed!"
else
  declare -a dockercmds[0]="rm -rf $HOME/Library/Containers/com.docker.docker" 
  dockercmds[1]="mkdir -p $HOME/goinfre/Docker/Data"
  dockercmds[2]="ln -s $HOME/goinfre/Docker $HOME/Library/Containers/com.docker.docker"
   
  for (( i=0; i < 3; i++))
    do
      $(${dockercmds[$i]})
      iter=$[ $iter + 34 ]
      ./.prog_bar/progressbar $iter -c red -s 30 
    done
  iter=0
  echo -e "\033[32mInstalling Docker have done!"
fi

echo -e "\033[36mInstalling HomeBrew..."

if [ -d $dirbrew ]
then
  echo -e "\033[35mHomebrew have been installed!"
else
  cd /opt/goinfre/$NameUser
  git clone -q https://github.com/Homebrew/brew homebrew
  eval "$(/opt/goinfre/$NameUser/homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
  cd
  ln -s /opt/goinfre/$NameUser /opt/goinfre
  echo -e "\033[32mInstalling HomeBrew have done!"
fi

echo -e "\033[34mSwitching to HomeBrew..."
cd
  declare -a switchcmds=( "chmod +x .zprofile" "./.zprofile" )
  for (( i=0; i < 2; i++))
    do
      $(${switchcmds[$i]})
      iter=$[ $iter + 51 ]
      ./.prog_bar/progressbar $iter -c red -s 30
    done
  iter=0
echo -e "\033[32mSwitching to HomeBrew done!"
echo -e "\033[36mInstalling LCOV GCOVR..."

if [ -d $dirlcov ]
then
  echo -e "\033[35mLCOV have been installed!"
else
  brew install lcov --quiet
  echo -e "\033[32mInstalling LCOV done!"
fi

if [ -d $dirgcovr ]
then
  echo -e "\033[35mGCOVR have been installed!"
else
  brew install gcovr --quiet
  echo -e "\033[32mInstalling GCOVR done!"
fi

echo -e "\033[32mInizialization completed!"