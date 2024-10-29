echo "Usuarios habilitados en Samba"
echo "Comando: sudo pdbedit -L"
echo
# pdbedit: manipula la base de datos de usuarios en un servidor Samba.  
# -L : lista usuarios habilitados en el servidor.
sudo pdbedit -L

echo

echo "Usuarios habilitados en FTP"
echo "Comando: sudo cat /etc/vsftpd.userlist"
# cat: concatena o muestra el contenido de un archivo.
# vsftpd.userlist : especifica una lista de usuarios permitidos en el servidor FTP (whitelist).
sudo  cat /etc/vsftpd.userlist

echo

echo "Usuarios sin restricciones en FTP"
echo "Comando: sudo cat /etc/vsftpd.chroot_list"

# vsftpd.chroot_list: Especifica que usuarios no estan limitados a su directorio Home. 
sudo cat /etc/vsftpd.chroot_list

echo

echo "Tree de puntos de montaje"
echo "Comando: sudo tree /srv"
# tree: proporciona una vista de todos los directorios y archivos en estructura de arbol. 
sudo tree /srv

echo

echo "Confirmando puntos de montaje"
echo "Comando: df /srv/*"
# df: muestra informacion sobre el uso del espacio en disco disponible en los sistemas de archivos montados. 
df /srv/*

echo
read -n 1 -s -r -p "..."
clear
