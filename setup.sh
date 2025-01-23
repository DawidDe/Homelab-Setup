#!/bin/bash

PS3='Which Server do you wanna setup?: '
select option in "Proxmox-1" "Raspberry-1" "Quit"
do
    case $option in
        "Proxmox-1")
            bash -c "$(wget -qLO - https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/proxmox-1.sh)"
            break
            ;;
        "Raspberry-1")
            bash -c "$(wget -qLO - https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/raspberry-1.sh)"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done