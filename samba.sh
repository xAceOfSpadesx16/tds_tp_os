echo "Comenzando la configuracion de Samba..."

echo "modificando el archivo /etc/samba/smb.conf" && sleep 1

echo "[Familia]" | sudo tee -a /etc/samba/smb.conf
echo "   path = /srv/smb/familia" | sudo tee -a /etc/samba/smb.conf
echo "   valid users = @GRP_FAMILIA" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
echo "   browsable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   create mask = 0770" | sudo tee -a /etc/samba/smb.conf
echo "   directory mask = 0770" | sudo tee -a /etc/samba/smb.conf

echo && sleep 1

echo "Reiniciando el servicio Samba"
echo "Comando: sudo systemctl restart smb"
sudo systemctl restart smb

echo && sleep 2

echo "Comprobando el estado del servicio Samba"
echo "Comando: systemctl status smb | sed -n '1,3p'"
systemctl status smb | sed -n '1,3p'

echo && sleep 2

echo "Listando recursos compartidos en Localhost mediante SMB"
echo "Comando: smbclient -L //localhost/"
smbclient -L //localhost/
