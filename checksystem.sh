#!/bin/bash                                                                             
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'  


echo -e  "  "
echo -e  " ═══════════════════════════════════════════════════ "
echo -e  " ${green}CHECK SYSTEM ERROR${NC} "       
echo -e  " ═══════════════════════════════════════════════════ "                            
echo -e  "  "                                                                            
                                                                            
status="$(systemctl show ssh.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SSH                : Running "$green"✓"$NC""                  
else                                                                                    
echo -e " SSh                : SSH Service is "$red"not running (Error)"$NC""        
fi

status="$(systemctl show openvpn.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " OPENVPN            : Running "$green"✓"$NC""
else                                                                                    
echo -e " OPENVPN            : OPENVPN Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show stunnel4.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " STUNNEL            : Running "$green"✓"$NC""                
else                                                                                    
echo -e " STUNNEL            : STUNNEL   Service is "$red"not running (Error)"$NC""        
fi                                                                                

status="$(systemctl show dropbear.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " DROPBEAR           : Running "$green"✓"$NC""             
else                                                                                    
echo -e " DROPBEAR           : DROPBEAR Service is "$red"not running (Error)"$NC""        
fi                                                                                      

status="$(systemctl show squid.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SQUID              : Running "$green"✓"$NC""
else                                                                                    
echo -e " SQUID              : SQUID Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show nginx.service --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " NGINX              : Running "$green"✓"$NC""
else                                                                                    
echo -e " NGINX              : NGINX Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show dropbear-ohp.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " DROPBEAR OHP       : Running "$green"✓"$NC""
else                                                                                    
echo -e " DROPBEAR OHP       : DROPBEAR OHP Service is "$red"not running (Error)"$NC""        
fi

status="$(systemctl show openvpn-ohp.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " OPENVPN OHP        : Running "$green"✓"$NC""
else                                                                                    
echo -e " OPENVPN OHP        : OPENVPN OHP Service is "$red"not running (Error)"$NC""        
fi

status="$(systemctl show edussh-nontls.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " SSH WS             : Running "$green"✓"$NC""
else                                                                                    
echo -e " SSH WS             : SSH WS Service is "$red"not running (Error)"$NC""        
fi

status="$(systemctl show edu-ovpn.service --no-page)"                                   
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " OVPN WS            : Running "$green"✓"$NC""
else                                                                                    
echo -e " OVPN WS            : OVPN WS Service is "$red"not running (Error)"$NC""        
fi

status="$(systemctl show trojan --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " TROJAN GFW         : Running "$green"✓"$NC""
else                                                                                    
echo -e " TROJAN GFW         : TROJAN GFW  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@v2ray-nontls --no-page)"                                 
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VMESS NON TLS : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAYVMESS NON TLS  : XRAY VMESS NON TLS Service is "$red"not running (Error)"$NC""    
fi                                                                                      

status="$(systemctl show xray@v2ray-tls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VMESS TLS     : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAYVMESS TLS      : XRAY VMESS TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-tls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS TLS     : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAY VLESS TLS     : XRAY VLESS TLS Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-nontls --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS NON TLS : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAY VLESS NON TLS : XRAY VLESS NON TLS  Service is "$red"not running (Error)"$NC""      
fi

status="$(systemctl show xray@vless-direct --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS XTLS    : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAY VLESS XTLS    : XRAY VLESS XTLS  Service is "$red"not running (Error)"$NC""
fi

status="$(systemctl show xray@vless-grpc --no-page)"                                      
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)                     
if [ "${status_text}" == "active" ]                                                     
then                                                                                    
echo -e " XRAY VLESS GRPC    : Running "$green"✓"$NC""
else                                                                                    
echo -e " XRAY VLESS GRPC    : XRAY VLESS GRPC  Service is "$red"not running (Error)"$NC""      
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu