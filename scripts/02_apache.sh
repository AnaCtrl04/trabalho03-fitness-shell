#!/bin/bash
# Script: 02_apache.sh
# Descricao: Instala e valida o Apache para a FitPlatform

LOG_FILE="/app/fitness/logs/apache.log"

instalar_apache() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Instalando Apache..."
    apt install -y apache2 >> $LOG_FILE 2>&1
    if [ $? -eq 0 ]; then
        echo "[OK] Apache instalado"
        echo "[OK] Apache instalado" >> $LOG_FILE
    else
        echo "[ERRO] Falha na instalacao do Apache"
    fi
}

verificar_apache() {
    echo "Verificando status do Apache..."
    if pgrep -x apache2 > /dev/null; then
        echo "[OK] Apache esta em execucao"
        echo "[OK] Apache em execucao" >> $LOG_FILE
    else
        echo "[AVISO] Apache nao esta rodando. Tentando iniciar..."
        apache2ctl start >> $LOG_FILE 2>&1
        echo "[OK] Apache iniciado"
    fi
}

versao_apache() {
    echo "Versao do Apache instalada:"
    apache2 -v
    apache2 -v >> $LOG_FILE 2>&1
}

instalar_apache
verificar_apache
versao_apache
