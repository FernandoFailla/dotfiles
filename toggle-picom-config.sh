#!/bin/bash

# Caminho para os diferentes arquivos de configuração do picom
CONFIG1="$HOME/.config/picom/picom.conf"      # Configuração padrão
CONFIG2="$HOME/.config/picom/picom-noblur.conf" # Configuração sem blur
CURRENT_CONFIG="$HOME/.config/picom/current-picom.conf"

# Verifica se o diretório e os arquivos de configuração existem
if [ ! -d "$HOME/.config/picom" ] || [ ! -f "$CONFIG1" ] || [ ! -f "$CONFIG2" ]; then
    echo "Erro: Diretório ou arquivos de configuração não encontrados."
    exit 1
fi

# Verifica se o picom está rodando e o mata
if pgrep picom > /dev/null; then
    pkill picom
    #sleep 1  # Aguarda um segundo para garantir que o processo foi finalizado
fi

# Verifica qual arquivo de configuração está em uso e alterna
if [ ! -L "$CURRENT_CONFIG" ] || [ "$(readlink "$CURRENT_CONFIG")" = "$CONFIG1" ]; then
    ln -sf "$CONFIG2" "$CURRENT_CONFIG"
    echo "Trocando para configuração sem blur"
else
    ln -sf "$CONFIG1" "$CURRENT_CONFIG"
    echo "Trocando para configuração padrão"
fi

# Inicia o picom com o arquivo de configuração atual
picom --config "$CURRENT_CONFIG"

echo "Picom reiniciado com a nova configuração"

