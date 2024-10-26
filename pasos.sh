echo "Trabajo Práctico - Sistemas Operativos y Redes de Datos:"
echo "1. Formatear el disco /dev/sdb y crear tabla de particiones GPT."
echo "2. Crear particiones sdb1 y sdb2 como primarias de 50% de capacidad cada una."
echo "3. Formatear las particiones con sistema de archivos ext4."
echo "4. Montar las particiones en el sistema de archivos."
echo "5. Agregar ambas particiones al archivo /etc/fstab con la opción 'defaults' para que se monten al inicio del sistema."
echo "6. Crear 3 usuarios para el grupo 'GRP-FAMILIA' que seran utilizados en el servidor SMB."
echo "7. Crear un grupo 'GRP-FAMILIA' e incluir los respectivos usuarios."
echo "8. Crear un directorio compartido en la partición sdb1 con permisos de usuario, grupo y setgid."
echo "9. Configurar Samba para compartir el directorio 'familia' mediante /etc/samba/smb.conf."
echo "10. Reiniciar el servicio Samba para que se apliquen los cambios."
echo "11. Crear 2 usuarios con sus respectivos homes en la partición sdb2."
echo "12. Levantar el servidor FTP."
echo "13. Poner a prueba ambos servidores."

echo "Requisitos"

echo "Disco: /dev/sdb"
echo "Paquetes: samba, vsftpd, git, tree"

echo

read -n 1 -s -r -p "..."
clear
