echo "Creando grupo familia"

echo "Comando: sudo groupadd GRP-FAMILIA"
sudo groupadd GRP-FAMILIA

echo

echo "----------------------------------"

echo "Creando usuarios para el grupo 'familia'"
# useradd opciones: -M no crea directorio home, -U crea un grupo con el mismo nombre del usuario, -s define shell de usuario
echo "Comando de creacion de usuario: sudo useradd -M -U -s /bin/bash <username>"
# sudo username chpasswd : se usa para poder actualizar o cambiar alguna contraseña
echo "Comando de establecer contraseña: sudo echo <username>:<password> | sudo chpasswd"
echo "Comando para agregar usuario a la base de datos de samba:"
echo "(echo <password>; echo <password>) | sudo smbpasswd -a <username>"

echo

read -p "Ingresa el nombre del primer usuario: " USUARIO_1
read -s -p "Ingrese la contraseña: " CONTRASENA_1
echo
echo "Creando usuario $USUARIO_1"
sudo useradd -M -U -s /bin/bash $USUARIO_1
echo "Estableciendo la contraseña para el usuario $USUARIO_1"
sudo echo $USUARIO_1:$CONTRASENA_1 | sudo chpasswd
echo "Usuario $USUARIO_1 creado con exito"

(
    echo $CONTRASENA_1
    echo $CONTRASENA_1
) | sudo smbpasswd -a $USUARIO_1

echo

read -p "Ingresa el nombre del segundo usuario: " USUARIO_2
read -s -p "Ingrese la contraseña: " CONTRASENA_2
echo
echo "Creando usuario $USUARIO_2"
sudo useradd -M -U -s /bin/bash $USUARIO_2
echo "Estableciendo la contraseña para el usuario $USUARIO_2"
sudo echo $USUARIO_2:$CONTRASENA_2 | sudo chpasswd
echo "Usuario $USUARIO_2 creado con exito"

(
    echo $CONTRASENA_2
    echo $CONTRASENA_2
) | sudo smbpasswd -a $USUARIO_2

echo

read -p "Ingresa el nombre del tercer usuario: " USUARIO_3
read -s -p "Ingrese la contraseña: " CONTRASENA_3
echo
echo "Creando usuario $USUARIO_3"
sudo useradd -M -U -s /bin/bash $USUARIO_3
echo "Estableciendo la contraseña para el usuario $USUARIO_3"
sudo echo $USUARIO_3:$CONTRASENA_3 | sudo chpasswd
echo "Usuario $USUARIO_3 creado con exito"

(
    echo $CONTRASENA_3
    echo $CONTRASENA_3
) | sudo smbpasswd -a $USUARIO_3

echo

echo "----------------------------------"

echo
read -n 1 -s -r -p "..."
echo
clear

echo "Agregando usuarios al grupo 'GRP-FAMILIA'"
# usermod : coamndo que modifica atributos de los usuarios 
# - aG : agrega a usuarios a grupos sin  eliminarlo de ootros grupos donde ya pertenece el usuario
echo "Comando: sudo usermod -aG GRP-FAMILIA <usuario>"
sudo usermod -aG GRP-FAMILIA $USUARIO_1
sudo usermod -aG GRP-FAMILIA $USUARIO_2
sudo usermod -aG GRP-FAMILIA $USUARIO_3
echo
echo " Usuarios $USUARIO_1, $USUARIO_2 y $USUARIO_3 agregados al grupo GRP-FAMILIA"
sudo cat /etc/group | grep GRP-FAMILIA

echo
read -n 1 -s -r -p "..."
echo
clear

echo "----------------------------------"

echo

echo "Creando directorio familia en la particion sdb1"
echo "Comando: sudo mkdir /srv/smb/familia"
# mkdir : crea directorios 
# -p = crea los directorios padres para el directorio principal
sudo mkdir -p /srv/smb/familia

echo && sleep 1

echo "definindo permisos para el directorio 'familia'"
# chmod : define quien puede leer , escribi o ejecutar un archivo 
echo "Comando: sudo chmod 2770 /srv/smb/familia"
sudo chmod 2770 /srv/smb/familia

echo && sleep 1

echo "Definiendo propietario y grupo del directorio 'familia'"
echo "Comando: sudo chown root:GRP-FAMILIA /srv/smb/familia"
# chown : cambia el propetario  de archivos o directorios 
sudo chown root:GRP-FAMILIA /srv/smb/familia

echo

echo "----------------------------------"
echo
read -n 1 -s -r -p "..."
clear
