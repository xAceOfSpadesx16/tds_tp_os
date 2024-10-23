echo "Bienvenidos al trabajo de Sistemas Operativos y Redes de Datos"

sudo bash pasos.sh
echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar a particionar..."
echo

sudo bash particiones.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la creacion y configuracion de usuarios para sdb1..."
echo

sudo bash smb_users.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de Samba..."
echo

sudo bash samba.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de FTP..."
echo

sudo bash ftp.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para finalizar..."
echo "Adios"
