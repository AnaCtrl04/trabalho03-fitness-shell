#!/bin/bash
# Script: 08_usuarios_permissoes.sh
# Descricao: Configuracao de usuarios e permissoes da FitPlatform

LOG_FILE="/app/fitness/logs/usuarios.log"

configurar_usuarios() {
    echo "Configurando usuarios e grupos da FitPlatform..."

    # Criar grupo fitness_ops
    if ! getent group fitness_ops > /dev/null 2>&1; then
        groupadd fitness_ops
        echo "[OK] Grupo fitness_ops criado" | tee -a $LOG_FILE
    else
        echo "[INFO] Grupo fitness_ops ja existe"
    fi

    # Criar usuario treino_user
    if ! id treino_user > /dev/null 2>&1; then
        useradd -m -g fitness_ops -s /bin/bash treino_user
        echo "[OK] Usuario treino_user criado" | tee -a $LOG_FILE
    else
        echo "[INFO] Usuario treino_user ja existe"
    fi

    # Criar usuario instrutores_user
    if ! id instrutores_user > /dev/null 2>&1; then
        useradd -m -g fitness_ops -s /bin/bash instrutores_user
        echo "[OK] Usuario instrutores_user criado" | tee -a $LOG_FILE
    else
        echo "[INFO] Usuario instrutores_user ja existe"
    fi
}

configurar_permissoes() {
    echo "Aplicando permissoes nos diretorios..."

    # Permissoes no diretorio de treinos
    chown -R treino_user:fitness_ops /app/fitness/treinos
    chmod -R 750 /app/fitness/treinos
    echo "[OK] Permissoes aplicadas em /app/fitness/treinos" | tee -a $LOG_FILE

    # Permissoes no diretorio de programas
    chown -R instrutores_user:fitness_ops /app/fitness/programas
    chmod -R 755 /app/fitness/programas
    echo "[OK] Permissoes aplicadas em /app/fitness/programas" | tee -a $LOG_FILE

    # Logs apenas para o dono
    chmod -R 700 /app/fitness/logs
    echo "[OK] Logs protegidos com chmod 700" | tee -a $LOG_FILE

    echo "Verificando permissoes:"
    ls -la /app/fitness/
}

configurar_usuarios
configurar_permissoes
