

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
UNPRIVILEGED=""
NESTED=""

prepare_os_docker

create_lxc_container

# Create a new container
create_lxc_container