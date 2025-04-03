# Actualizar sistema
apt update && apt upgrade -y

# Instalación de paquetes necesarios
apt -y install nginx nodejs npm

# Instalación de la pantalla LCD
cd /tmp && rm -rf rm -rf LCD-show
git clone https://github.com/goodtft/LCD-show.git
chmod -R 755 LCD-show
cd LCD-show && ./MHS35-show

# Instalación de BackupWeb
cd /srv/http && mkdir -p BackupWeb{logs,ssl}
git clone https://github.com/loft17/BackupTravelWeb.git
mv BackupTravelWeb public_html
cd public_html && npm install



