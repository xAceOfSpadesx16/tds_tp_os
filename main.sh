echo "Bienvenidos al trabajo de Sistemas Operativos y Redes de Datos"

sudo bash pasos.sh

echo

sudo bash required.sh

echo

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar a particionar..."
echo
clear

sudo bash particiones.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la creacion y configuracion de usuarios para sdb1..."
echo
clear

sudo bash smb_users.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de Samba..."
echo
clear
sudo bash samba.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la creacion de usuarios para el servidor FTP..."
echo
clear
sudo bash ftp_users.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de FTP..."
echo
clear
sudo bash ftp.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para finalizar..."
echo "Adios"
