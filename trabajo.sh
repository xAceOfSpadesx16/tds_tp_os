echo "Bienvenidos al trabajo de Sistemas Operativos y Redes de Datos"

./pasos.sh
echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar a particionar..."
echo

./particiones.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de Samba..."
echo

./users.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para comenzar la configuracion de FTP..."
echo

./ftp.sh

echo
read -n 1 -s -r -p "Presiona cualquier tecla para saludar..."
echo "Adios"
