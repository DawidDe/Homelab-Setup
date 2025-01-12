
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
    sleep 10
    pct exec $CTID -- apk update
    pct exec $CTID -- apk upgrade
    pct exec $CTID -- apk add curl bash
}

install_docker() {
    pct exec $CTID -- apk add docker docker-compose
}

prepare_app() {
    pct exec $CTID -- curl -o compose.yaml https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/$APP.yaml
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/up.sh
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/down.sh
    pct exec $CTID -- chmod +x up.sh down.sh
    pct exec $CTID -- ./up.sh
}