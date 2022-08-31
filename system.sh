#!/bin/bash
clear
red='\e[0;35m'
bred1='\e[47m'
bred='\e[47m'
blue='\e[1;34m'
blue_b='\e[1;94m'
yellow='\e[1;31m'
purple='\e[0;33m'
white='\e[0;37m'
try='\e[0;103m'
cyan='\e[0;36m'
green='\e[0;35m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
IZIN=$(curl https://raw.githubusercontent.com/GH-reyz/GH-reyz/main/Register%20IP | grep $MYIP | awk '{print $4}')
if [ $MYIP = $IZIN ]; then
  echo -e ""
  clear
else
  echo -e ""
  echo -e "${green}ACCESS DENIED...PM TELEGRAM OWNER @GHReyz${NC}"
  exit 1
fi
echo " "
echo -e " ${yellow}════════════════════════════════════════════════════════════════="
echo -e " ${bred1}                        • SYSTEM MENU •                          "${NC}
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " ${green}[  1 ]\e[m \e[$purple ADD/CHANGE DOMAIN VPS\e[m          \e[$green[  2 ]\e[m \e[$purple CHANGE PORT SERVICE"
echo -e " ${green}[  3 ]\e[m \e[$purple CHANGE DNS SERVER\e[m              \e[$green[  4 ]\e[m \e[$purple RENEW CERTIFICATION"
echo -e " ${green}[  5 ]\e[m \e[$purple WEBMIN MENU\e[m                    \e[$green[  6 ]\e[m \e[$purple CHECK RAM USAGE"
echo -e " ${green}[  7 ]\e[m \e[$purple REBOOT VPS\e[m                     \e[$green[  8 ]\e[m \e[$purple SPEEDTEST VPS"
echo -e " ${green}[  9 ]\e[m \e[$purple DISPLAY SYSTEM INFORMATION\e[m     \e[$green[ 10 ]\e[m \e[$purple CHECK STREAM GEO"
echo -e " ${green}[ 11 ]\e[m \e[$purple CHANGE SCRIPT BANNER\e[m           \e[$green[ 12 ]\e[m \e[$purple CHECK SERVICE ERROR"
echo -e " ${green}[ 13 ]\e[m \e[$purple UPDATE SCRIPT\e[m                  \e[$green[ 14 ]\e[m \e[$purple EXIT MENU${NC}"
echo -e " ${yellow}═════════════════════════════════════════════════════════════════"
echo -e " "
echo -e "\e[1;37m"
read -p "     Please select an option :  " system
echo -e " "
echo -e "\e[0m"
case $system in
1)
  add-host
  ;;
2)
  change
  ;;
3)
  mdns
  ;;
4)
  recert-xrayv2ray
  ;;
5)
  wbmn
  ;;
6)
  ram
  ;;
7)
  reboot
  ;;
8)
  speedtest
  ;;
9)
  info
  ;;
10)
  nf
  ;;
11)
  banner_changer
  ;;
12)
  checksystem
  ;;
13)
  update
  ;;
14)
  vnstat
  ;;
0)
  sleep 0.5
  clear
  jinggo
  ;;
*)
  echo -e "ERROR!! Please Enter an Correct Number"
  sleep 1
  clear
  system
  ;;
esac
