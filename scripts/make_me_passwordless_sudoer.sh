#!/bin/bash
sudo grep -q $USER /etc/sudoers && {
    echo "/etc/sudoers already mentions you in the following line:"
    sudo grep $USER /etc/sudoers
    exit 1
}
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
