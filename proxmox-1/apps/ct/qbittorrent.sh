# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/functions.sh)

# Some important variables
APP="qbittorrent"
CTID=""
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES=""
RAM_SIZE=""
DISK_SIZE=""
IP=""
GATEWAY="192.168.178.1"
ROOT_PASSWORD=""
HOSTNAME="qbittorrent"
UNPRIVILEGED=""
NESTED="1"

create_container

prepare_config_folder

prepare_container

install_docker

prepare_docker_app

start_docker_app