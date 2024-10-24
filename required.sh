echo "----------------------------------"

while true; do
    read -p "¿Posee instalados los paquetes requeridos? (s/n): " respuesta
    respuesta=${respuesta,,}
    [[ "$respuesta" == "s" || "$respuesta" == "n" ]] && break
    echo "Entrada inválida. Por favor, ingresa 's' o 'n'."
done

if [[ "$respuesta" == "n" ]]; then
    echo "Actualizando lista de paquetes..."
    sudo apt update &>/dev/null
    echo "Instalando paquetes..."
    sudo apt install -y samba vsftpd git tree &>/dev/null
fi

echo "Listo para comenzar."
echo "----------------------------------"
