# source install script
source <(curl -s https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/scripts/install.sh)

generate_password_and_secret_key() {
    pct exec $CTID -- echo "PG_PASS=$(openssl rand -base64 36 | tr -d '\n')" >> .env
    pct exec $CTID -- echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60 | tr -d '\n')" >> .env
}

# Some important variables
APP="authentik"
CTID="101"
TEMPLATE="alpine-3.21-default_20241217_amd64.tar.xz"
CPU_CORES="2"
RAM_SIZE="2048"
DISK_SIZE=""
IP="192.168.178.2/24"
GATEWAY="192.168.178.1"
ROOT_PASSWORD="dawid"
HOSTNAME="authentik"
UNPRIVILEGED=""
NESTED="1"

create_container

prepare_config_folder

prepare_container

install_docker

prepare_docker_app

generate_password_and_secret_key

start_docker_app