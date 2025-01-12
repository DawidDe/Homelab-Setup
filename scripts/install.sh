

prepare_os_docker() {
    apk update
    apk upgrade
    apk add docker docker-compose curl
}

prepare_os() {
    apk update
    apk upgrade
}