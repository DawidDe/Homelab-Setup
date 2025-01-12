
create_container() {
    pct create $CTID $TEMPLATE \
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
    apk update
    apk upgrade
    apk add curl bash
}

install_docker() {
    apk add docker docker-compose
}

prepare_app() {
    curl -o compose.yaml https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/$APP.sh
    curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/up.sh
    curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/down.sh
    chmod +x up.sh down.sh
}