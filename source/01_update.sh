#!/bin/bash
# Script: 01_update.sh
# Descricao: Atualiza o sistema do container fitness
# Autor: Ana Martins | Tema: Plataforma de Treinos Online

LOG_FILE="/app/fitness/logs/update.log"

# Funcao principal de atualizacao
atualizar_sistema() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando atualizacao do sistema..."
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando atualizacao" >> $LOG_FILE

    apt update -y >> $LOG_FILE 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] apt update concluido"
    else
        echo "[ERRO] Falha no apt update"
        exit 1
    fi

    apt upgrade -y >> $LOG_FILE 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] Sistema atualizado com sucesso!"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sistema atualizado" >> $LOG_FILE
    else
        echo "[ERRO] Falha na atualizacao"
        echo "[ERRO] Falha na atualizacao" >> $LOG_FILE
    fi
}

atualizar_sistema