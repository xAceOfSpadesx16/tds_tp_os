echo "Comenzando la configuracion de Samba..."

echo "modificando el archivo /etc/samba/smb.conf" && sleep 1

echo
echo "Definiendo la sección [global] -> map to guest = never"
# grep : es como un buscador dentro de los archivos o directorios   
# el if esta para ver si grep escuentra el global en la configuracion de samba 
# si esta busca (map to guest) para modificarlo y si no esta lo crea 
# en el else esta por si no esta el global , lo crea y agrega el comando map to guest
if grep -q "^\[global\]" /etc/samba/smb.conf; then
    sudo sed -i '/^\[global\]/,/^\[.*\]/ s/^ *map to guest *=.*/map to guest = never/' /etc/samba/smb.conf
else
    echo -e "[global]\nmap to guest = never\n$(cat /etc/samba/smb.conf)" | sudo tee /etc/samba/smb.conf >/dev/null
fi

echo && sleep 1

echo "Definiendo recurso compartido 'Familia'"
# tee : muentra la salida en la terminal y guarda la misma salida en un archivo,txt
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
# en este comando reinicia el servidor de samba 
sudo systemctl restart smbd

echo && sleep 2

echo "Comprobando el estado del servicio Samba"
echo "Comando: sudo systemctl status smbd --no-pager"
# aqui compueva que el servidor SAMBA este corriendo correctamente 
systemctl status smbd --no-pager

echo
read -n 1 -s -r -p "..."
clear
