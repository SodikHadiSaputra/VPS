#!/bin/bash
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "=========-Selamat Akun Anda Sudah Aktif-================================="
echo -e "Host: $IP" 
echo -e "Port: ( OpenSSH 22,143 ) ( Dropbear 109,110,443) ( Squid 80,81,8000,8080)"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-------------------------------------------------------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "========================================================================="
echo -e "=========================Script By Sodik Hadi Saputra===================="
