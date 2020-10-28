#!/usr/bin/env bash

#Bash para configurar CentOS Post instalacion
# 1. Ejecutar script de configuracion
# 2. Habilitar ssh 
# 3. Instalar Mysql
# 4. Importar Dump a Msyql


    if [ $(whoami) != "root" ]; then #Comando whoami, usuario actual que esta logueado en el sistema e inicio el bash
		echo "Tienes que ser root para ejecutar este script"
		echo "Ejecuta "sudo su" usuario y contraseñra para ser root"
		exit 1
    fi

#---------------------------------------------------------------------------------------------------------------------

echo -e "\t-------------Menu---------------------"
echo ""
echo -e "\t1. Ejecutar script de configuracion"
echo -e "\t2. Instalar ssh "
echo -e "\t3. Restart ssh "
echo -e "\t4. Instalar Mysql"
echo -e "\t5. Descargar repositorio Base de datos"
echo -e "\t6. Importar Dump a Msyql"

echo -e "\tDigite una opcion"
read op

case "$op" in 
    1) 
    echo "Ejecutar script de configuracion"
    echo "Instalando Vim..."
    echo sleep 3
    yum install vim 
    echo "Configurando  idioma a US..."
    echo sleep 3
    localectl set-keymap us
    clear
    ./menu.sh
    ;;

    2)
    echo "Instalar ssh"
    echo "Instalacion y configuracion ssh"
    echo sleep 3
    yum install openssh-server 
    echo "Se abrira fichero de configuracion para editar"
    echo sleep 3
    vim /etc/ssh/sshd_config
    clear
    ./menu.sh
    ;;

    3)
    echo "Restart ssh..."
    sleep 3
    systemctl restart sshd
    clear
    ./menu.sh
    ;;

    4)
    echo "Instalacion Mysql..."
    sleep 3
    ./installMysql.sh
    
    
    exit 
    ;;
    5)
    echo "Descargando repositorio..."
    sleep 3
    git clone https://github.com/rubenGainza/BaseDeDatos_CDS.git
    clear
    ./menu.sh
    ;;
    6)
    echo "Importar Dump a Mysql..."
    sleep 3
    mysql -u root -p dbTriage < /home/$USER/installMysqlCentos7/BaseDeDatos_CDS/Dump.sql && echo "Transaccion realizada con exito!"
    sleep 3
    clear
    ./menu.sh

    ;;

esac 
