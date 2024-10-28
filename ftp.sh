sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "Modificando el archivo /etc/vsftpd.conf"
echo "Comando: sudo tee -a /etc/vsftpd.conf << EOF ... EOF"
sleep 1
echo "Variables añadidas:"
# tee y opciones : tee lee la entrada estandar y escribe en la salida estandar 
# -a : añade la salida al final de archivo.txt en lugar de sobrescribirlo 
sudo tee -a /etc/vsftpd.conf <<EOF
anonymous_enable=NO
write_enable=YES
local_enable=YES
local_umask=027
force_dot_files=NO
chroot_local_user=YES
allow_writeable_chroot=YES
userlist_enable=YES
userlist_deny=NO
userlist_file=/etc/vsftpd.userlist
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list

EOF

echo && sleep 1

echo "Reiniciando el servicio vsftpd"
# systemctl restart : reinicia serviocios de sistermas basados en systemd
sudo systemctl restart vsftpd

echo && sleep 2

echo "Comprobando el estado del servicio vsftpd"
# systemctl status : comprueba si esta corriendo el servidor 
sudo systemctl status vsftpd --no-pager

echo

read -n 1 -s -r -p "..."
clear
