curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/apps/ct/nginx-proxy-manager.sh
bash nginx-proxy-manager.sh
rm nginx-proxy-manager.sh

curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/apps/ct/vaultwarden.sh
bash vaultwarden.sh
rm vaultwarden.sh

curl -O https://raw.githubusercontent.com/DawidDe/Proxmox-Scripts/refs/heads/master/apps/ct/jellyfin.sh
bash jellyfin.sh
rm jellyfin.sh