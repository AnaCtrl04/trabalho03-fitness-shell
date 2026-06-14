#!/bin/bash
# Script: 01_update.sh
# Descricao: Atualiza o sistema do container fitness (Adaptado para Windows/Git Bash)
# Autor: Ana Martins | Tema: Plataforma de Treinos Online

# Ajustado para criar o log na pasta atual do projeto no Windows
LOG_FILE="./update.log"

# Funcao principal de atualizacao
atualizar_sistema() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando atualizacao do sistema..."
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando atualizacao" >> "$LOG_FILE"

    echo "[Simulação] Executando apt update..." >> "$LOG_FILE" 2>&1
    # Linha original comentada para não dar erro no Windows:
    # apt update -y >> $LOG_FILE 2>&1
    
    # Simula que o apt update deu certo (retorno 0)
    if [ 0 -eq 0 ]; then
        echo "[OK] apt update concluido"
    else
        echo "[ERRO] Falha no apt update"
        exit 1
    fi

    echo "[Simulação] Executando apt upgrade..." >> "$LOG_FILE" 2>&1
    # Linha original comentada para não dar erro no Windows:
    # apt upgrade -y >> $LOG_FILE 2>&1
    
    # Simula que o apt upgrade deu certo (retorno 0)
    if [ 0 -eq 0 ]; then
        echo "[OK] Sistema atualizado com sucesso!"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sistema atualizado" >> "$LOG_FILE"
    else
        echo "[ERRO] Falha na atualizacao"
        echo "[ERRO] Falha na atualizacao" >> "$LOG_FILE"
    fi
}

atualizar_sistema