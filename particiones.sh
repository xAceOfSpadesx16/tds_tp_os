echo "Creando tabla de particiones GPT en disco /dev/sdb"
echo "Comando: sudo parted -s /dev/sdb mklabel gpt"
sudo parted -s /dev/sdb mklabel gpt

echo && sleep 1

echo "Creando particion sdb1 en disco /dev/sdb"
echo "Comando: sudo parted -s /dev/sdb mkpart primary ext4 0% 50%"
sudo parted -s /dev/sdb mkpart primary ext4 0% 50%

echo && sleep 1

echo "Creando particion sdb2 en disco /dev/sdb - tamaño de particion: 50%"
echo "Comando: sudo parted -s /dev/sdb mkpart primary ext4 50% 100%"
sudo parted -s /dev/sdb mkpart primary ext4 50% 100%

echo && sleep 1

echo "Formateando particion sdb1 con sistema de archivos ext4 dedicado para Samba"
echo "Comando: sudo mkfs.ext4 /dev/sdb1"
sudo mkfs.ext4 /dev/sdb1

echo && sleep 1

echo "Formateando particion sdb2 con sistema de archivos ext4"
echo "Comando: sudo mkfs.ext4 /dev/sdb2"
sudo mkfs.ext4 /dev/sdb2

echo && sleep 1

echo "----------------------------------"

echo

echo "Listando particiones del disco /dev/sdb"
echo "Comando: sudo parted -s /dev/sdb"
sudo parted -s /dev/sdb

echo

echo "----------------------------------"

echo && sleep 1

echo "Creando directorios para montar las particiones"
sudo mkdir -p /srv/smb
sudo mkdir -p /srv/ftp

echo "Modificando archivo /etc/fstab"
echo "Incluyendo particion sdb1 al archivo"
echo "Comando: echo "/dev/sdb1 /srv/smb ext4 defaults 0 2" | sudo tee -a /etc/fstab > /dev/null"
echo "/dev/sdb1  /srv/smb  ext4  defaults  0  2" | sudo tee -a /etc/fstab >/dev/null

echo && sleep 1

echo "Incluyendo particion sdb2 al archivo"
echo "Comando: echo "/dev/sdb2 /srv/ftp ext4 defaults 0 2" | sudo tee -a /etc/fstab > /dev/null"
echo "/dev/sdb2  /srv/ftp  ext4  defaults  0  2" | sudo tee -a /etc/fstab >/dev/null

echo && sleep 1

echo "Montando particiones en el sistema de archivos"
echo "Comando: sudo mount -a"
sudo mount -a

echo && sleep 1

echo "----------------------------------"

echo

echo "Listando particiones montadas"
echo "Comando: lsblk"
sudo lsblk

echo

echo "----------------------------------"
