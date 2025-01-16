# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/install.sh)

# Some important variables
APP="vaultwarden"
CTID="101"
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES="1"
RAM_SIZE="512"
DISK_SIZE="1"
IP="192.168.178.2/24"
GATEWAY="192.168.178.1"
ROOT_PASSWORD="dawid"
HOSTNAME="vaultwarden"
UNPRIVILEGED=""
NESTED="1"

create_container

prepare_config_folder

prepare_container

install_docker

prepare_docker_app

start_docker_app