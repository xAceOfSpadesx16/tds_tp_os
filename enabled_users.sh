echo "Usuarios habilitados en Samba"
echo "Comando: sudo pdbedit -L"
echo
#
sudo pdbedit -L

echo

echo "Usuarios habilitados en FTP"
echo "Comando: sudo cat /etc/vsftpd.userlist"
#
sudo sudo cat /etc/vsftpd.userlist

echo

echo "Usuarios sin restricciones en FTP"
echo "Comando: sudo cat /etc/vsftpd.chroot_list"

#
sudo sudo cat /etc/vsftpd.chroot_list

echo

echo "Tree de puntos de montaje"
echo "Comando: sudo tree /srv"
#
sudo tree /srv

echo

echo "Confirmando puntos de montaje"
echo "Comando: df /srv/*"
#
df /srv/*

echo
read -n 1 -s -r -p "..."
clear
