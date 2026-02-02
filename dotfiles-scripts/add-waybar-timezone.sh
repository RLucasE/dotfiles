#!/bin/bash

# Script para agregar timezone al clock en waybar config
CONFIG_FILE="$HOME/.config/waybar/config.jsonc"
TIMEZONE_LINE='"timezone": "America/Argentina/Buenos_Aires",'

# Verificar si el archivo existe
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: No se encuentra el archivo $CONFIG_FILE"
    exit 1
fi

# Verificar si la línea de timezone ya existe
if grep -q '"timezone": "America/Argentina/Buenos_Aires"' "$CONFIG_FILE"; then
    echo "La timezone ya está configurada en el archivo"
    exit 0
fi

# Buscar la sección "clock" y agregar la línea de timezone
# Usamos sed para insertar después de "clock": {
sed -i '/"clock": {/a\    '"$TIMEZONE_LINE" "$CONFIG_FILE"

echo "Timezone agregada correctamente al config de waybar"