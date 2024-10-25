echo "Comenzando la configuracion de Samba..."

echo "modificando el archivo /etc/samba/smb.conf" && sleep 1

echo "[Familia]" | sudo tee -a /etc/samba/smb.conf
echo "   path = /srv/smb/familia" | sudo tee -a /etc/samba/smb.conf
echo "   valid users = @GRP-FAMILIA" | sudo tee -a /etc/samba/smb.conf
echo "   read only = no" | sudo tee -a /etc/samba/smb.conf
echo "   browsable = yes" | sudo tee -a /etc/samba/smb.conf
echo "   create mask = 2770" | sudo tee -a /etc/samba/smb.conf
echo "   directory mask = 2770" | sudo tee -a /etc/samba/smb.conf

echo && sleep 1

# echo "Creando usuario usuario_demo"
# echo "Comando1: sudo useradd -M -s /usr/sbin/nologin usuario_demo"
# echo "Comando2: (echo 123; echo 123) | sudo smbpasswd -a usuario_demo"
# sudo useradd -M -s /usr/sbin/nologin usuario_demo

# (
#     echo 123
#     echo 123
# ) | sudo smbpasswd -a usuario_demo

echo "Reiniciando el servicio Samba"
echo "Comando: sudo systemctl restart smb"
sudo systemctl restart smbd

echo && sleep 2

echo "Comprobando el estado del servicio Samba"
echo "Comando: systemctl status smb | sed -n '1,3p'"
systemctl status smbd --no-pager

# echo && sleep 2

# echo "Listando recursos compartidos en Localhost mediante SMB"
# echo "Comando: smbclient -L //localhost/ -U usuario_demo%123"
# smbclient -L //localhost/ -U usuario_demo%123

echo
read -n 1 -s -r -p "..."
echo
clear
