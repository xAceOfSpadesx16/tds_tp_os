echo "Usuarios habilitados en Samba"
echo "Comando: sudo pdbedit -L"
echo
#   pdbedit y opciones : 
# pdbedit : edita la base de datos de usuarios en un servidor Samba  
# -L : se usa para visualizar info detallada sobre los usuarios 
sudo pdbedit -L

echo

echo "Usuarios habilitados en FTP"
echo "Comando: sudo cat /etc/vsftpd.userlist"
# userlist : especifica una list de usuarios que tiene acceso restringido 
sudo  cat /etc/vsftpd.userlist

echo

echo "Usuarios sin restricciones en FTP"
echo "Comando: sudo cat /etc/vsftpd.chroot_list"

# chroot : cambia directorios de raiz 
# chroot_list : especifica que usuarios estan limitados a su directorio de inicio 
sudo cat /etc/vsftpd.chroot_list

echo

echo "Tree de puntos de montaje"
echo "Comando: sudo tree /srv"
# tree : se proporciona una vista de todos los directorios y archivos en estructura de arbol 
sudo tree /srv

echo

echo "Confirmando puntos de montaje"
echo "Comando: df /srv/*"
# df : muestra informacion sobre el uso sdel espacio del  disco en los sistemas de archivos 
df /srv/*

echo
read -n 1 -s -r -p "..."
clear
