

prepare_os_docker() {
    apk update
    apk upgrade
    apk add docker docker-compose curl
}

prepare_os() {
    apk update
    apk upgrade
}

create_lxc_container() {
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

docker_preparation() {
    
}