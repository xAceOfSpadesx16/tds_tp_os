sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "Modificando el archivo /etc/vsftpd.conf"
echo "Comando: sudo tee -a /etc/vsftpd.conf << EOF ... EOF"
sleep 1
echo "Variables añadidas:"
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
sudo systemctl restart vsftpd

echo && sleep 2

echo "Comprobando el estado del servicio vsftpd"
sudo systemctl status vsftpd --no-pager
