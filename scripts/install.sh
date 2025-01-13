
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

prepare_config_folder() {
    mkdir /apps/$APP
    chown 100000:100000 /apps/$APP
    chmod 755 /apps/$APP
    pct set $CTID -mp0 /apps/$APP,mp=/docker/$APP
}

prepare_container() {
    pct start $CTID
    sleep 10
    pct exec $CTID -- apk upgrade --update && apk add curl bash
}

install_docker() {
    pct exec $CTID -- apk add docker docker-compose
    pct exec $CTID -- rc-update add docker boot
    pct exec $CTID -- service docker start
}

prepare_docker_app() {
    pct exec $CTID -- curl -o compose.yaml https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/$APP.yaml
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/up.sh
    pct exec $CTID -- curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/compose/down.sh
    pct exec $CTID -- chmod +x up.sh down.sh
}

start_docker_app() {
    pct exec $CTID -- ./up.sh
}