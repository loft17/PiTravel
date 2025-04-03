# Obtiene el directorio desde el que se ejecuta el script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
USER_NAME=$(whoami)

# Actualizar sistema
apt update && apt upgrade -y

# Instalación de paquetes necesarios
apt -y install nginx nodejs npm python3-tk python3-venv

# Instalación de la pantalla LCD
cd /tmp && rm -rf rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git
chmod -R 755 LCD-show
cd LCD-show && ./MHS35-show

# Instalación de QuickBackupWeb
mkdir -p /srv/http/QuickBackupWeb && cd /srv/http/QuickBackupWeb
git clone https://github.com/loft17/QuickBackupWeb.git
mv QuickBackupWeb public_html
cd public_html && npm install
cp $SCRIPT_DIR/files/web_nginx /etc/nginx/site-enable

# Instalación QuickBackup
cd /home/$USER_NAME/Documents/
git clone https://github.com/loft17/QuickBackup.git
cd QuickBackup
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Configurar wifi-hotspot
cp $SCRIPT_DIR/files/wifipi.sh /opt/hotspot.sh
chmod +x /opt/hotspot.sh


# varios
rm -f /etc/nginx/sites-enabled/default

# Reiniciar sistema
reboot


