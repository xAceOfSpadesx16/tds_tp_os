echo "Creando usuarios para el servidor FTP"
# -d: especifica el directorio de inicio de un nuevo usuario.
# -m: crea el directorio home del usuario.
# -k: especifica un directorio de plantilla para el home del usuario.
echo "Comando de creacion de usuario: sudo useradd -d /srv/ftp/<username> -m -U -s /sbin/bash -k /etc/skel <username>"
echo "Comando de establecer contraseña: sudo echo <username>:<password> | sudo chpasswd"

echo

read -p "Ingresa el nombre del primer usuario: " USUARIO_1
read -s -p "Ingrese la contraseña: " CONTRASENA_1
echo
echo "Creando usuario $USUARIO_1"
sudo useradd -d /srv/ftp/$USUARIO_1 -m -U -s /bin/bash -k /etc/skel $USUARIO_1
echo "Estableciendo la contraseña para el usuario $USUARIO_1"
sudo echo $USUARIO_1:$CONTRASENA_1 | sudo chpasswd
echo "Usuario $USUARIO_1 creado con exito"

echo

read -p "Ingresa el nombre del segundo usuario: " USUARIO_2
read -s -p "Ingrese la contraseña: " CONTRASENA_2
echo
echo "Creando usuario $USUARIO_2"
sudo useradd -d /srv/ftp/$USUARIO_2 -m -U -s /bin/bash -k /etc/skel $USUARIO_2
echo "Estableciendo la contraseña para el usuario $USUARIO_2"
sudo echo $USUARIO_2:$CONTRASENA_2 | sudo chpasswd
echo "Usuario $USUARIO_2 creado con exito"

echo

echo "Agregando usuarios a ftp users list"
echo -E 'Comando: echo -e "$USUARIO_1\n$USUARIO_2" | sudo tee /etc/vsftpd.userlist > /dev/null'
echo -e "$USUARIO_1\n$USUARIO_2" | sudo tee /etc/vsftpd.userlist >/dev/null

echo

echo "Agregando 2° usuarios a ftp chroot_list lo que quita la limitacion de home"
echo "Comando: echo -e "$USUARIO_2" | sudo tee /etc/vsftpd.chroot_list > /dev/null"
echo -e "$USUARIO_2" | sudo tee /etc/vsftpd.chroot_list >/dev/null

echo
read -n 1 -s -r -p "..."
clear
