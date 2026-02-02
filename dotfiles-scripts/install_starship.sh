#!/bin/bash

# Script para instalar starship y configurarlo en ~/.bashrc (Arch Linux)

# Función para verificar si starship está instalado
is_starship_installed() {
    command -v starship >/dev/null 2>&1
}

# Función para verificar si la línea de inicialización ya está en ~/.bashrc
is_starship_in_bashrc() {
    grep -q 'eval "$(starship init bash)"' ~/.bashrc 2>/dev/null
}

# Verificar e instalar starship si no está presente
if ! is_starship_installed; then
    echo "Starship no está instalado. Instalando con pacman..."
    sudo pacman -S starship --noconfirm
    
    # Verificar si la instalación fue exitosa
    if is_starship_installed; then
        echo "✓ Starship se instaló correctamente"
    else
        echo "✗ Error al instalar starship. Por favor, instálelo manualmente"
        exit 1
    fi
else
    echo "✓ Starship ya está instalado"
fi

# Agregar la línea de inicialización a ~/.bashrc si no está presente
if ! is_starship_in_bashrc; then
    echo "Agregando inicialización de starship a ~/.bashrc..."
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    echo "✓ Línea agregada a ~/.bashrc"
else
    echo "✓ La inicialización de starship ya está en ~/.bashrc"
fi

echo "¡Configuración completada! Reinicia tu terminal o ejecuta 'source ~/.bashrc' para aplicar los cambios"