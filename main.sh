echo
echo "Bienvenidos al trabajo de Sistemas Operativos y Redes de Datos"
echo
# read y opciones :
# read : recibe una entrada (input) del usuario.
# -n 1: especifica el numero de caracteres a leer antes de devolver el script.
# -s : oculta la entrada del usuario (utilizado comunmente para definir  contraseñas o informacion sensible).
# -r : evita que el backslash (\) se interprete como un caracter de escape.
# -p : permite especificar un mensaje para mostrar al usuario antes de leer la entrada.
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
# hostname : muestra o establece el nombre del host del sistema 
echo "IP: $(hostname -I)"
echo
