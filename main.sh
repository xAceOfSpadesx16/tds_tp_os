echo
echo "Bienvenidos al trabajo de Sistemas Operativos y Redes de Datos"
echo
#
read -n 1 -s -r -p "Comenzar la presentación..."
clear

sudo bash pasos.sh

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar a particionar..."
echo
clear

sudo bash particiones.sh

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la creacion y configuracion de usuarios para sdb1..."
clear

sudo bash smb_users.sh

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de Samba..."
clear
sudo bash samba.sh

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la creacion de usuarios para el servidor FTP..."
echo
clear

sudo bash ftp_users.sh

read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de FTP..."
clear

sudo bash ftp.sh

read -n 1 -s -r -p "Presiona cualquier tecla para ver los usuarios habilitados..."
clear

sudo bash enabled_users.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para finalizar..."
clear
echo
echo "Gracias por su atencion, ahora a testear!"
echo
#
echo "IP: $(hostname -I)"
echo
