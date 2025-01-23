#!/bin/bash

PS3='Which Server do you wanna setup?: '
select option in "Proxmox-1" "Raspberry-1" "Quit"
do
    case $option in
        "Proxmox-1")
            echo "You chose Proxmox-1"
            break
            ;;
        "Raspberry-1")
            echo "You chose Raspberry-1"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done