#!/bin/bash
# My Telegram : https://t.me/donaya365
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/donaya365/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/donaya365"
exit 0
fi
# Link Hosting Kalian
donaya365="raw.githubusercontent.com/donaya365/scriptvps/main/backup"

curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://${donaya365}/rclone.conf"
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user donaya365store@gmail.com
from donaya365store@gmail.com
password xbnelgkimafglnva 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
wget -O autobackup "https://${donaya365}/autobackup.sh"
wget -O backup "https://${donaya365}/backup.sh"
wget -O restore "https://${donaya365}/restore.sh"
wget -O strt "https://${donaya365}/strt.sh"
wget -O limitspeed "https://${donaya365}/limitspeed.sh"
chmod +x autobackup
chmod +x backup
chmod +x restore
chmod +x strt
chmod +x limitspeed
cd
rm -f /root/set-br.sh