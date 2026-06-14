#!/bin/bash
# Script: menu.sh
# Descricao: Menu principal de automacao da FitPlatform

SCRIPTS_DIR="/app/scripts"

exibir_menu() {
    clear
    echo "========================================"
    echo " Criado por: Ana Martins"
    echo " Instituicao: Unidavi"
    echo " Tema: Plataforma de Treinos Online"
    echo "========================================"
    echo "   MENU DEVOPS — FITPLATFORM CLOUD"
    echo "========================================"
    echo " 1 - Atualizar sistema"
    echo " 2 - Instalar Apache"
    echo " 3 - Criar estrutura do projeto"
    echo " 4 - Realizar backup"
    echo " 5 - Fazer deploy do site"
    echo " 6 - Ver processos"
    echo " 7 - Monitorar sistema"
    echo " 8 - Configurar usuarios e permissoes"
    echo " 9 - Gerar relatorio"
    echo " 0 - Sair"
    echo "========================================"
    echo -n " Escolha uma opcao: "
}

while true; do
    exibir_menu
    read OPCAO
    case $OPCAO in
        1) bash $SCRIPTS_DIR/01_update.sh ;;
        2) bash $SCRIPTS_DIR/02_apache.sh ;;
        3) bash $SCRIPTS_DIR/03_estrutura.sh ;;
        4) bash $SCRIPTS_DIR/04_backup.sh ;;
        5) bash $SCRIPTS_DIR/05_deploy.sh ;;
        6) bash $SCRIPTS_DIR/06_processos.sh listar ;;
        7) bash $SCRIPTS_DIR/07_monitoramento.sh ;;
        8) bash $SCRIPTS_DIR/08_usuarios_permissoes.sh ;;
        9) bash $SCRIPTS_DIR/09_relatorio.sh ;;
        0) echo "Saindo... Ate logo!"; exit 0 ;;
        *) echo "Opcao invalida!" ;;
    esac
    echo ""
    echo "Pressione ENTER para continuar..."
    read
done
