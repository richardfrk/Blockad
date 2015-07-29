#!/bin/bash

x="teste"
menu ()
{
while true $x != "teste"

do
clear

echo "Menu"

echo "1. Block Skype ad's."
echo "2. Configuration."
echo "3. Reboot Skype."
echo "4. Exit."
read x

case "$x" in 

    1)
      echo "Writing ad domains to host file..."
	  cat domains.txt > /etc/hosts_test	
      sleep 5
      
echo "================================================"
;;
    2)
      echo "Informe o nome do pacote para ser removido?"
      read nome
      apt-get remove --purge $nome
      sleep 5
echo "================================================"
;;
   3)
      echo "Atualizando sistema..."
      apt-get update
      sleep 5
echo "================================================"
;;
    4)
       echo "Iniciando o processo..."
       apt-get -f install
       sleep 5
echo "================================================"
;;      
     5)  
       echo "Corrigindo erros..." 
       apt-get autoremove
       sleep 5
echo "================================================"
;;
    6) 
    echo "Reparando..."
    dpkg --configure -a
    sleep 5

echo "================================================"
 ;;     
       7)
         echo "saindo..."
         sleep 5
         clear;
         exit;
echo "================================================"
;;

*)
        echo "Opção inválida!"
esac
done

}
menu
