#!/bin/bash
# Script: 03_estrutura.sh
# Descricao: Cria estrutura de diretorios da FitPlatform

LOG_FILE="/app/fitness/logs/estrutura.log"
BASE="/app/fitness"

criar_estrutura() {
    echo "Criando estrutura de diretorios da FitPlatform..."

    if [ -d "$BASE" ]; then
        echo "Removendo estrutura antiga..."
        rm -rf $BASE/treinos $BASE/usuarios $BASE/programas
    fi

    mkdir -p $BASE/treinos/iniciantes
    mkdir -p $BASE/treinos/intermediarios
    mkdir -p $BASE/treinos/avancados
    mkdir -p $BASE/usuarios/ativos
    mkdir -p $BASE/usuarios/inativos
    mkdir -p $BASE/programas/forca
    mkdir -p $BASE/programas/cardio
    mkdir -p $BASE/programas/hiit
    mkdir -p $BASE/logs
    mkdir -p $BASE/backups

    echo "[OK] Estrutura criada em $BASE"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Estrutura criada" >> $LOG_FILE

    touch $BASE/treinos/iniciantes/cardio_express.txt
    touch $BASE/treinos/avancados/forca_total.txt
    touch $BASE/programas/forca/semana1.txt

    echo "Diretorios criados:"
    find $BASE -type d | sort
}

criar_estrutura
