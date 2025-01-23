# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/functions.sh)

prepare_media_folder() {
    mkdir /media
    chown 100000:100000 /media
    chmod 755 /media
    pct exec $CTID -- mkdir /docker/$APP/media
    pct set $CTID -mp0 /media,mp=/docker/$APP/media
}

# Some important variables
APP="jellyfin"
CTID="102"
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES="1"
RAM_SIZE="2048"
DISK_SIZE="10"
IP="192.168.178.3/24"
GATEWAY="192.168.178.1"
ROOT_PASSWORD="dawid"
HOSTNAME="jellyfin"
UNPRIVILEGED=""
NESTED="1"

create_container

prepare_config_folder

prepare_media_folder

prepare_container

install_docker

prepare_docker_app

start_docker_app