#!/bin/bash

mkdir -p /media/raajay/software

# common installs
sudo apt-get install --assume-yes htop

# spacemacs stuff
sudo apt-get install --assume-yes ispell
sudo apt-get install --assume-yes build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev xvfb
wget http://ftpmirror.gnu.org/emacs/emacs-25.1.tar.gz -O /media/raajay/software/emacs-25.1.tar.gz
cd /media/raajay/software; tar xvfz emacs-25.1.tar.gz
cd /media/raajay/software/emacs-25.1; ./configure --without-x && make -j8 && sudo make install

git clone https://github.com/syl20bnr/spacemacs /media/raajay/software/dotemacs.d
ln -s /media/raajay/software/dotemacs.d /users/raajay86/.emacs.d

git clone https://raajay@bitbucket.org/raajay/spacemacs.git /media/raajay/software/dotspacemacs.d
ln -s /media/raajay/software/dotspacemacs.d /users/raajay86/.spacemacs.d

# bear to generate compile_commands.json


# tmux stuff
sudo apt-get install --assume-yes tmux
git clone https://bitbucket.org/raajay/tmuxinator.git /media/raajay/software/dottmux
ln -s /media/raajay/software/dottmux /users/raajay86/.tmux
ln -s /media/raajay/software/dottmux/_tmux_monokai_simple_conf /users/raajay86/.tmux.conf


# bash stuff
cp /local/repository/script/bash_stuff /users/raajay86/.bash_aliases
