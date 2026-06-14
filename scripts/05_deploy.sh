#!/bin/bash
# Script: 05_deploy.sh
# Descricao: Deploy do site FitPlatform no Apache

ORIGEM="/app/source"
DESTINO="/var/www/html"
LOG_FILE="/app/fitness/logs/deploy.log"

realizar_deploy() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando deploy da FitPlatform..."

    if [ ! -d "$ORIGEM" ]; then
        echo "[ERRO] Pasta source nao encontrada: $ORIGEM"
        exit 1
    fi

    echo "Limpando diretorio de destino..."
    rm -rf $DESTINO/*

    cp -r $ORIGEM/* $DESTINO/
    echo "[OK] Arquivos copiados para $DESTINO"

    if [ -f "$DESTINO/index.html" ]; then
        echo "[OK] index.html publicado com sucesso"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deploy OK" >> $LOG_FILE
    else
        echo "[ERRO] index.html nao encontrado no destino"
        exit 1
    fi

    echo "Arquivos publicados em $DESTINO:"
    ls -lh $DESTINO
}

realizar_deploy
