echo "Creando tabla de particiones GPT en disco /dev/sdb"
# parted -s : gestiona la particion de un disco sin solicitar confirmacion del usuario 
echo "Comando: sudo parted -s /dev/sdb mklabel gpt"
sudo parted -s /dev/sdb mklabel gpt

echo && sleep 1

echo "Creando particion sdb1 en disco /dev/sdb"
# mkpart primary : crea uan particionpeimaria en el disco (aqui se le especifica que tome hasta el 50% del dsico)
echo "Comando: sudo parted -s /dev/sdb mkpart primary ext4 0% 50%"
sudo parted -s /dev/sdb mkpart primary ext4 0% 50%

echo && sleep 1

echo "Creando particion sdb2 en disco /dev/sdb - tamaño de particion: 50%"
# ahora se le indica que tome la otra mitad del disco (del 50% al 100%)
echo "Comando: sudo parted -s /dev/sdb mkpart primary ext4 50% 100%"
sudo parted -s /dev/sdb mkpart primary ext4 50% 100%

echo && sleep 1

echo "Formateando particion sdb1 con sistema de archivos ext4 dedicado para Samba"
# mkfs : crea un sistema de archivos en una particion 
echo "Comando: sudo mkfs.ext4 /dev/sdb1"
sudo mkfs.ext4 /dev/sdb1 >/dev/null

echo && sleep 1

echo "Formateando particion sdb2 con sistema de archivos ext4"
echo "Comando: sudo mkfs.ext4 /dev/sdb2"
sudo mkfs.ext4 /dev/sdb2 >/dev/null

echo
read -n 1 -s -r -p "..."
clear

echo "----------------------------------"

echo

echo "Listando particiones del disco /dev/sdb"
# print : muestra como quedo particionado el disco 
echo "Comando: sudo parted -s /dev/sdb print"
sudo parted -s /dev/sdb print

echo

echo "----------------------------------"
echo
read -n 1 -s -r -p "..."
echo
clear

echo "Creando directorios para montar las particiones"
sudo mkdir -p /srv/smb
sudo mkdir -p /srv/ftp

echo "Modificando archivo /etc/fstab"
#defaults : son las opciones predeterminadas del montaje 
# 0 : indica que no se hace un backup de la particion , 2 : es la particion que va a ser revisada 
echo "Comando: echo '/dev/sdb<num_particion> /srv/smb ext4 defaults 0 2' | sudo tee -a /etc/fstab > /dev/null"

echo "Incluyendo particion sdb1 al archivo"
echo "/dev/sdb1  /srv/smb  ext4  defaults  0  2" | sudo tee -a /etc/fstab >/dev/null

echo "Incluyendo particion sdb2 al archivo"
echo "/dev/sdb2  /srv/ftp  ext4  defaults  0  2" | sudo tee -a /etc/fstab >/dev/null

echo && sleep 1

echo "Reiniciando daemon de montaje"
# deamon-reload : recargas los archivos de configurracion de los srvicios sin reiniciar el sistema 
echo "Comando: sudo systemctl daemon-reload"
sudo systemctl daemon-reload

echo && sleep 1

echo "Montando particiones en el sistema de archivos"
# mount -a : este monta todas las particiones especificadas en los archivos 
echo "Comando: sudo mount -a"
sudo mount -a

echo && sleep 1

echo
read -n 1 -s -r -p "..."
echo
clear

echo "----------------------------------"

echo

echo "Listando particiones montadas"
# lsblk : hace una lista de dispositivos de bloques en un formato de arbol mostrando detalles como nombre, tamaño, tipos y puntos de montaje 
echo "Comando: lsblk"
sudo lsblk

echo

echo "----------------------------------"

echo
read -n 1 -s -r -p "..."
clear
