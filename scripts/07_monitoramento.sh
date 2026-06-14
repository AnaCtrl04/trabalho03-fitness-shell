#!/bin/bash
# Script: 07_monitoramento.sh
# Descricao: Monitoramento do servidor FitPlatform

LOG_FILE="/app/fitness/logs/monitoramento.log"
LIMITE_CPU=80
LIMITE_MEM=80
LIMITE_DISCO=80

monitorar() {
    echo "========================================"
    echo " MONITORAMENTO FITPLATFORM"
    echo " $(date '+%Y-%m-%d %H:%M:%S')"
    echo "========================================"
    echo "" | tee -a $LOG_FILE

    # CPU
    CPU=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2}' | cut -d'%' -f1 | cut -d',' -f1)
    echo "CPU em uso: ${CPU}%"
    if (( $(echo "$CPU > $LIMITE_CPU" | bc -l 2>/dev/null || echo 0) )); then
        echo "[ALERTA] Uso de CPU acima de ${LIMITE_CPU}%" | tee -a $LOG_FILE
    else
        echo "[OK] CPU dentro do limite" | tee -a $LOG_FILE
    fi

    # Memoria
    MEM=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    echo "Memoria em uso: ${MEM}%"
    if [ "$MEM" -gt "$LIMITE_MEM" ]; then
        echo "[ALERTA] Uso de memoria acima de ${LIMITE_MEM}%" | tee -a $LOG_FILE
    else
        echo "[OK] Memoria dentro do limite" | tee -a $LOG_FILE
    fi

    # Disco
    DISCO=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
    echo "Disco em uso: ${DISCO}%"
    if [ "$DISCO" -gt "$LIMITE_DISCO" ]; then
        echo "[ALERTA] Uso de disco acima de ${LIMITE_DISCO}%" | tee -a $LOG_FILE
    else
        echo "[OK] Disco dentro do limite" | tee -a $LOG_FILE
    fi

    # Apache
    echo ""
    if pgrep -x apache2 > /dev/null; then
        echo "[OK] Apache em execucao" | tee -a $LOG_FILE
    else
        echo "[ALERTA] Apache NAO esta em execucao!" | tee -a $LOG_FILE
    fi
    echo ""
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Monitoramento concluido" >> $LOG_FILE
}

monitorar
