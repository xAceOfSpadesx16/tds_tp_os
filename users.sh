echo "creando grupo familia"
sudo groupadd GRP-FAMILIA

echo

echo "----------------------------------"

echo "Creando usuarios para el grupo 'familia'"
read -p "Ingresa el nombre del primer usuario: " USUARIO_1
read -p "Ingrese la contraseña: " CONTRASENA_1
echo "Creando usuario $USUARIO_1"
echo "Comando: sudo useradd -d /srv/smb/$USUARIO_1 -g familia -m -s /bin/bash $USUARIO_1 -p *******"
sudo useradd -d /srv/smb/$USUARIO_1 -g familia -m -s /bin/bash $USUARIO_1 -p $CONTRASENA_1
echo "Usuario $USUARIO_1 creado"

read -p "Ingresa el nombre del segundo usuario: " USUARIO_2
read -p "Ingrese la contraseña: " CONTRASENA_2
echo "Creando usuario $USUARIO_2"
echo "Comando: sudo useradd -d /srv/smb/$USUARIO_2 -g familia -m -s /bin/bash $USUARIO_2 -p *******"
sudo useradd -d /srv/smb/$USUARIO_2 -g familia -m -s /bin/bash $USUARIO_2 -p $CONTRASENA_2
echo "Usuario $USUARIO_2 creado"

read -p "Ingresa el nombre del tercer usuario: " USUARIO_3
read -p "Ingrese la contraseña: " CONTRASENA_3
echo "Creando usuario $USUARIO_3"
echo "Comando: sudo useradd -d /srv/smb/$USUARIO_3 -g familia -m -s /bin/bash $USUARIO_3 -p *******"
sudo useradd -d /srv/smb/$USUARIO_3 -g familia -m -s /bin/bash $USUARIO_3 -p $CONTRASENA_3
echo "Usuario $USUARIO_3 creado"

echo

echo "----------------------------------"

echo

echo "Agregando usuarios al grupo 'familia'"
echo "Comando: sudo usermod -aG GRP-FAMILIA <usuario>"
sudo usermod -aG GRP-FAMILIA $USUARIO_1
sudo usermod -aG GRP-FAMILIA $USUARIO_2
sudo usermod -aG GRP-FAMILIA $USUARIO_3
echo "Grupos 'familia' agregados a los usuarios $USUARIO_1, $USUARIO_2 y $USUARIO_3"
sudo cat /etc/group | grep GRP-FAMILIA

echo

echo "----------------------------------"

echo

echo "Creando directorio familia en la particion sdb1"
echo "Comando: sudo mkdir /srv/smb/familia"
sudo mkdir /srv/smb/familia

echo

echo "definindo permisos para el directorio 'familia'"
echo "Comando: sudo chmod 2770 /srv/smb/familia"
sudo chmod 2770 /srv/smb/familia

echo

echo "Definiendo propietario y grupo del directorio 'familia'"
echo "Comando: sudo chown root:GRP-FAMILIA /srv/smb/familia"
sudo chown root:GRP-FAMILIA /srv/smb/familia

echo

echo "----------------------------------"
