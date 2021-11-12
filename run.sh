#! /bin/bash -eux

git pull
LOCALVERSION=-dev-load-addr make CC="ccache gcc" -j4
sudo make modules_install
sudo make install

read -p "reboot? (y/N): " yn
case "$yn" in
  [yY]*) sudo reboot now;;
esac
