# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/install.sh)

# Some important variables
APP=""
CTID=""
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES=""
RAM_SIZE=""
DISK_SIZE=""
IP=""
GATEWAY="192.168.178.1"
ROOT_PASSWORD=""
HOSTNAME=""
UNPRIVILEGED=""
NESTED="1"

create_container

prepare_config_folder

prepare_container

install_docker

prepare_docker_app