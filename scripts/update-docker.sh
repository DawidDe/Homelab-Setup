apk upgrade --update
bash down.sh
docker compose up -d --pull always
docker system prune -a
reboot now