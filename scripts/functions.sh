# General System functions
upgrade_system() {
    apt update
    apt upgrade -y
}

cleanup_system() {
    apt autoremove -y
    apt autoclean -y
}

enable_unattended_upgrades() {
    apt install unattended-upgrades -y
    dpkg-reconfigure --priority=low unattended-upgrades
}

harden_ssh() {
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    systemctl restart ssh
}

enable_ufw() {
    apt install ufw -y
    ufw allow 22
    ufw allow 80
    ufw allow 443
    ufw enable
}

# LXC functions
create_container() {
    pct create $CTID /var/lib/vz/template/cache/$TEMPLATE \
    --cores $CPU_CORES \
    --memory $RAM_SIZE \
    --rootfs local-lvm:$DISK_SIZE \
    --net0 name=eth0,bridge=vmbr0,firewall=1,gw=$GATEWAY,ip=$IP \
    --password $ROOT_PASSWORD \
    --hostname $HOSTNAME \
    --unprivileged $UNPRIVILEGED \
    --features nesting=$NESTED
}

prepare_container() {
    pct start $CTID
    sleep 5
    pct exec $CTID -- apk upgrade --update
    pct exec $CTID -- apk add curl bash
}

# Docker functions
install_docker() {
    pct exec $CTID -- apk add docker docker-compose
    pct exec $CTID -- rc-update add docker boot
    pct exec $CTID -- reboot now
    sleep 5
}

prepare_docker_app() {
    pct exec $CTID -- curl -o compose.yaml https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/$APP.yaml
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/up.sh
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/down.sh
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/update-docker.sh
    pct exec $CTID -- chmod +x up.sh down.sh update-docker.sh
    pct exec $CTID -- echo "0 0 * * * /root/update-docker.sh" | crontab -
}

start_docker_app() {
    pct exec $CTID -- ./up.sh
}

# App specific functions
# Jellyfin functions
prepare_config_folder() {
    mkdir /apps/$APP
    chown 100000:100000 /apps/$APP
    chmod 755 /apps/$APP
    pct set $CTID -mp0 /apps/$APP,mp=/docker/$APP
}