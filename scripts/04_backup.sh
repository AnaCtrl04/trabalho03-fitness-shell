#!/bin/bash
# Script: 04_backup.sh
# Descricao: Backup automatizado da FitPlatform

ORIGEM="/app/fitness"
DESTINO="/app/fitness/backups"
LOG_FILE="/app/fitness/logs/backup.log"
DATA=$(date '+%Y-%m-%d_%H-%M')
ARQUIVO="backup_fitness_$DATA.tar.gz"

realizar_backup() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando backup..."

    if [ ! -d "$ORIGEM" ]; then
        echo "[ERRO] Diretorio de origem nao encontrado: $ORIGEM"
        exit 1
    fi

    mkdir -p $DESTINO

    tar -czf $DESTINO/$ARQUIVO --exclude=$DESTINO $ORIGEM >> $LOG_FILE 2>&1

    if [ -f "$DESTINO/$ARQUIVO" ]; then
        TAMANHO=$(du -sh $DESTINO/$ARQUIVO | cut -f1)
        echo "[OK] Backup criado: $ARQUIVO ($TAMANHO)"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup: $ARQUIVO ($TAMANHO)" >> $LOG_FILE
    else
        echo "[ERRO] Falha ao criar backup"
        echo "[ERRO] Falha no backup" >> $LOG_FILE
        exit 1
    fi
}

realizar_backup
