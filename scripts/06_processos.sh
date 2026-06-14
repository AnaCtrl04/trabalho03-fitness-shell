#!/bin/bash
# Script: 06_processos.sh
# Descricao: Gerenciamento de processos da FitPlatform
# Uso: ./06_processos.sh [listar|buscar <nome>|matar <PID>]

listar_processos() {
    echo "=== Processos ativos no servidor FitPlatform ==="
    ps aux --no-headers | head -20
}

buscar_processo() {
    NOME=$1
    if [ -z "$NOME" ]; then
        echo "[ERRO] Informe o nome do processo. Exemplo: ./06_processos.sh buscar apache2"
        exit 1
    fi
    echo "Buscando processo: $NOME"
    RESULTADO=$(pgrep -l $NOME)
    if [ -n "$RESULTADO" ]; then
        echo "[OK] Processo encontrado:"
        echo "$RESULTADO"
    else
        echo "[AVISO] Nenhum processo com nome '$NOME' encontrado"
    fi
}

matar_processo() {
    PID=$1
    if [ -z "$PID" ]; then
        echo "[SEGURANCA] Informe o PID para encerrar. Exemplo: ./06_processos.sh matar 1234"
        exit 1
    fi
    echo "[AVISO] Encerrando processo PID: $PID"
    kill -9 $PID
    if [ $? -eq 0 ]; then
        echo "[OK] Processo $PID encerrado"
    else
        echo "[ERRO] Nao foi possivel encerrar o processo $PID"
    fi
}

case $1 in
    listar) listar_processos ;;
    buscar) buscar_processo $2 ;;
    matar)  matar_processo $2 ;;
    *) echo "Uso: ./06_processos.sh [listar|buscar <nome>|matar <PID>]" ;;
esac
