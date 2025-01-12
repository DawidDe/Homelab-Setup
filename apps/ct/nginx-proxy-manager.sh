# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/install.sh)

# Some important variables
TYPE="docker"
APP="nginx-proxy-manager"
CTID="100"
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES="1"
RAM_SIZE="1024"
DISK_SIZE="10"
IP="192.168.178.4/24"
GATEWAY="192.168.178.1"
ROOT_PASSWORD="dawid"
HOSTNAME="npm"
UNPRIVILEGED="1"
NESTED="1"

create_container

prepare_container

install_docker

prepare_app