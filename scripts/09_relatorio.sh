#!/bin/bash
# Script: 09_relatorio.sh
# Descricao: Gera relatorio operacional da FitPlatform

RELATORIO="/app/fitness/logs/relatorio_execucao.txt"

gerar_relatorio() {
    echo "Gerando relatorio operacional..."

    cat > $RELATORIO << EOF
========================================
RELATORIO OPERACIONAL - FITPLATFORM
========================================
Data/Hora: $(date '+%Y-%m-%d %H:%M:%S')
Projeto: Plataforma de Treinos e Exercicios Online
Tema: Trabalho 01 - Exercicios Online
Aluno: Ana Martins

--- ESPACO EM DISCO ---
$(df -h /)

--- USO DOS DIRETORIOS ---
$(du -sh /app/fitness/* 2>/dev/null)

--- STATUS DO APACHE ---
$(pgrep -x apache2 > /dev/null && echo '[OK] Apache em execucao' || echo '[ALERTA] Apache parado')

--- ULTIMOS BACKUPS ---
$(ls -lht /app/fitness/backups/ 2>/dev/null | head -5 || echo 'Nenhum backup encontrado')

--- ARQUIVOS PUBLICADOS ---
$(ls -lh /var/www/html/ 2>/dev/null || echo 'Nenhum arquivo publicado')

--- USUARIOS E GRUPOS ---
$(cat /etc/passwd | grep -E 'treino_user|instrutores_user' || echo 'Usuarios nao configurados')
$(cat /etc/group | grep fitness_ops || echo 'Grupo nao configurado')

--- LOGS RECENTES ---
$(ls -lht /app/fitness/logs/ 2>/dev/null | head -5)
========================================
EOF

    echo "[OK] Relatorio salvo em: $RELATORIO"
    cat $RELATORIO
}

gerar_relatorio
