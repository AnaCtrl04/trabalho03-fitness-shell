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
    echo " 6 - Gerenciar processos (Submenu)"
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
        6) 
            while true; do
                clear
                echo "========================================"
                echo "     SUBMENU — GESTÃO DE PROCESSOS"
                echo "========================================"
                echo " 1 - Listar processos ativos"
                echo " 2 - Buscar processo por nome"
                echo " 3 - Matar processo por PID"
                echo " 0 - Voltar ao menu principal"
                echo "========================================"
                echo -n " Escolha uma opcao do submenu: "
                read SUBOPCAO
                
                case $SUBOPCAO in
                    1) 
                        bash $SCRIPTS_DIR/06_processos.sh listar 
                        ;;
                    2) 
                        echo -n "Digite o nome do processo para buscar: "
                        read NOME_PROC
                        bash $SCRIPTS_DIR/06_processos.sh buscar "$NOME_PROC"
                        ;;
                    3) 
                        echo -n "Digite o PID do processo para encerrar: "
                        read PID_PROC
                        bash $SCRIPTS_DIR/06_processos.sh matar "$PID_PROC"
                        ;;
                    0) 
                        break 
                        ;;
                    *) 
                        echo "Opcao invalida no submenu!" 
                        ;;
                esac
                echo ""
                echo "Pressione ENTER para continuar no submenu..."
                read
            done
            continue # Pula o "Pressione ENTER" do menu principal ao voltar
            ;;
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