#!/bin/bash
clear
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)

echo -e ""
bash /root/.fontsam/banner
echo -e "\e[line ═════════════════════════════════════════════" 
echo -e "\e[back_text             XRAY VLESS GRPC${NC}                     "   
echo -e "\e[line ═════════════════════════════════════════════" 
echo -e "   [ 1 ] CREATE NEW USER"
echo -e "   [ 2 ] DELETE ACTIVE USER"
echo -e "   [ 3 ] EXTEND ACTIVE USER"
echo -e "   [ 4 ] CHECK USER LOGIN"
echo -e " ════════════════════════════════════════════════ " 
echo -e "   [ 0 ] EXIT TO MENU"
echo -e " ════════════════════════════════════════════════" 
echo -e "\e[1;31m"
read -p "     Please select an option :  "  xray
echo -e "\e[0m"
case $xray in
      1)
      add-grpc
      ;;
      2)
      del-grpc
      ;;
      3)
      renew-grpc
      ;;
      4)
      cek-grpc
      ;;
      0)
      menu
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 1
      clear
      mgrpc
      ;;
      esac
