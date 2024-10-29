echo "Comenzando la configuracion de Samba..."

echo "modificando el archivo /etc/samba/smb.conf" && sleep 1

echo
echo "Definiendo la sección [global] -> map to guest = never"
# grep : permite buscar patrones dentro de los archivos o directorios
# instruccion if: busca la sección [global] en el archivo smb.conf. 
# si se cumple la instruccion, entonces busca la seccion (map to guest) para modificarlo (si no esta lo crea).
# instruccion else: en caso de que no se cumpla la instruccion if, crea la seccion [global] y agrega map to guest.
# sed: permite editar y transformar texto de forma no interactiva.
# -i: permite editar el archivo original.

if grep -q "^\[global\]" /etc/samba/smb.conf; then
    sudo sed -i '/^\[global\]/,/^\[.*\]/ s/^ *map to guest *=.*/map to guest = never/' /etc/samba/smb.conf
else
    echo -e "[global]\nmap to guest = never\n$(cat /etc/samba/smb.conf)" | sudo tee /etc/samba/smb.conf >/dev/null
fi

echo && sleep 1

echo "Definiendo recurso compartido 'Familia'"
echo "Comandos: echo '<line>' | sudo tee -a /etc/samba/smb.conf"

echo "[Familia]" | sudo tee -a /etc/samba/smb.conf
echo "   path = /srv/smb/familia" | sudo tee -a /etc/samba/smb.conf
echo "   valid users = @GRP-FAMILIA" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
echo "   browsable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   create mask = 2770" | sudo tee -a /etc/samba/smb.conf
echo "   directory mask = 2770" | sudo tee -a /etc/samba/smb.conf
echo "   guest ok = no" | sudo tee -a /etc/samba/smb.conf

echo && sleep 1

echo "Reiniciando el servicio Samba"
echo "Comando: sudo systemctl restart smbd"
# restart smbd: reinicia el servicio de samba
sudo systemctl restart smbd

echo && sleep 2

echo "Comprobando el estado del servicio Samba"
echo "Comando: sudo systemctl status smbd --no-pager"
# status smbd: comprueba que el servidor SAMBA este siendo ejecutado correctamente.
# --no-pager: desactiva el uso de paginación en la salida de systemctl.
systemctl status smbd --no-pager

echo
read -n 1 -s -r -p "..."
clear
