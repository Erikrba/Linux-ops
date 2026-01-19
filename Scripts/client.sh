#!/bin/bash
#Version: 1.03
#creator: Alexandre Mariano Lopes de Deus
# Colocar em /usr/local/bin

CAMINHO=/usr/lib/clientscript/Load
USR=$(echo rplat)
RCV=client
case "$1" in
	                  hospedeiras-ocs)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/hospocs.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh  -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh rplat@"${CSSHIP[@]}"
                fi
          ;;



	          hospedeiras-npp)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/hospnpp.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh $USR@"${CSSHIP[@]}"
                fi
          ;;


           hospedeiras-v3)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/hospv3.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh $USR@"${CSSHIP[@]}"
                fi
          ;;

	   hospedeiras-smsc)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/hospsmsc.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh $USR@"${CSSHIP[@]}"
                fi
          ;;

        hospedeiras-v4)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/hospv4.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]} 
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh $USR@"${CSSHIP[@]}"
                fi
          ;;
	
	v3)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadv3.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;
	v4)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 2----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadv4.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados
			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;
        idp)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadidp.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;
	tr069)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadtr069.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;
	urano)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadurano.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;

        eir)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadeir.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

			cssh -l $USR "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh $USR@"${CSSHIP[@]}"
		fi
	  ;;

	ocs)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 3----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadocs.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados
			cssh -l rplat "${CSSHIP[@]}"
		else
			#acessa a maquina selecionada na variavel IP
			ssh  "${CSSHIP[@]}" -l rplat
		fi
	  ;;
	         zabbix)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 2----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/loadzabbix.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados
                        cssh -l rplat "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh  "${CSSHIP[@]}" -l rplat
                fi
          ;;

	npp-old)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 4----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadnpp.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados
			cssh -l rplat "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
			ssh  "${CSSHIP[@]}" -l rplat
		fi
	  ;;
	  npp)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 4----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadnpp-new.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados
			cssh -l rplat "${CSSHIP[@]}"
		else
			#acessa ḿáquina selecionada na variavel IP
                       ssh "${CSSHIP[@]}" -l rplat

		fi
	  ;;
	 ssr)	COND="0 /tmp/temp.txt"
			clear
			#laço para busca de palavras
			while [ "$COND" == "0 /tmp/temp.txt" ];do
				echo "---------------------- ACESSO REMOTO VM's $1 4----------------------"
				read -p "Entre com a busca: " MAQUINA
				echo "Busca por: $MAQUINA"
				echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
				#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
				grep -i "$MAQUINA" $CAMINHO/loadssr.txt > /tmp/temp.txt
				#verifica se arquivo gerado pela busca está vazio
				COND=$(wc -l /tmp/temp.txt)
				#imprime mensagem na tela e limpa
				if [ "$COND" == "0 /tmp/temp.txt" ]
				  then
					clear
					echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
				fi
				#enumera as buscas para serem utilizadas como menu/switch
				nl -n ln /tmp/temp.txt > /tmp/temp1.txt
				#exibe o resultado da busca
				cat /tmp/temp1.txt
				echo ""
				echo "0	VOLTAR"
			done
			#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
			read -p"Selecione a máquina: " -a SELECAO
			echo ${SELECAO[@]}
			#verifica se usuário deseja voltar ou continuar
			if [ "$SELECAO" == "0" ]
			  then
				$RCV $1
			else
				for i in "${SELECAO[@]}"; do
					#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
					IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
					declare -a CSSHIP[i]=$IP
					echo "$IP"
				done
			fi
			clear
			#remove arquivos temporarios do scrip
			rm /tmp/temp.txt /tmp/temp1.txt
			#echo ${#CSSHIP[@]} 
			#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
			if [ "${#CSSHIP[@]}" -gt "1" ]
			  then		
				#concatena o cssh com o usuário e com os ip's encontrados
				cssh -l $USR "${CSSHIP[@]}"
			else
				#acessa ḿáquina selecionada na variavel IP
				ssh "${CSSHIP[@]}" -l $USR
			fi
		  ;;
		 eventos)	COND="0 /tmp/temp.txt"
			clear
			#laço para busca de palavras
			while [ "$COND" == "0 /tmp/temp.txt" ];do
				echo "---------------------- ACESSO REMOTO VM's $1 4----------------------"
				read -p "Entre com a busca: " MAQUINA
				echo "Busca por: $MAQUINA"
				echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
				#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
				grep -i "$MAQUINA" $CAMINHO/loadeventos.txt > /tmp/temp.txt
				#verifica se arquivo gerado pela busca está vazio
				COND=$(wc -l /tmp/temp.txt)
				#imprime mensagem na tela e limpa
				if [ "$COND" == "0 /tmp/temp.txt" ]
				  then
					clear
					echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
				fi
				#enumera as buscas para serem utilizadas como menu/switch
				nl -n ln /tmp/temp.txt > /tmp/temp1.txt
				#exibe o resultado da busca
				cat /tmp/temp1.txt
				echo ""
				echo "0	VOLTAR"
			done
			#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
			read -p"Selecione a máquina: " -a SELECAO
			echo ${SELECAO[@]}
			#verifica se usuário deseja voltar ou continuar
			if [ "$SELECAO" == "0" ]
			  then
				$RCV $1
			else
				for i in "${SELECAO[@]}"; do
					#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
					IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
					declare -a CSSHIP[i]=$IP
					echo "$IP"
				done
			fi
			clear
			#remove arquivos temporarios do scrip
			rm /tmp/temp.txt /tmp/temp1.txt
			#echo ${#CSSHIP[@]} 
			#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
			if [ "${#CSSHIP[@]}" -gt "1" ]
			  then		
				#concatena o cssh com o usuário e com os ip's encontrados
				cssh -l $USR "${CSSHIP[@]}"
			else
				#acessa ḿáquina selecionada na variavel IP
				ssh "${CSSHIP[@]}" -l $USR
			fi
		  ;;


	smsc)	COND="0 /tmp/temp.txt"
		clear
		#laço para busca de palavras
		while [ "$COND" == "0 /tmp/temp.txt" ];do
			echo "---------------------- ACESSO REMOTO VM's $1 5----------------------"
			read -p "Entre com a busca: " MAQUINA
			echo "Busca por: $MAQUINA"
			echo "        NOME      	IP SERVIÇO	IP GERENCIA    	APLICAÇÕES"
			#busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
			grep -i "$MAQUINA" $CAMINHO/loadsmsc.txt > /tmp/temp.txt
			#verifica se arquivo gerado pela busca está vazio
			COND=$(wc -l /tmp/temp.txt)
			#imprime mensagem na tela e limpa
			if [ "$COND" == "0 /tmp/temp.txt" ]
			  then
				clear
				echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
			fi
			#enumera as buscas para serem utilizadas como menu/switch
			nl -n ln /tmp/temp.txt > /tmp/temp1.txt
			#exibe o resultado da busca
			cat /tmp/temp1.txt
			echo ""
			echo "0	VOLTAR"
		done
		#recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
		read -p"Selecione a máquina: " -a SELECAO
		echo ${SELECAO[@]}
		#verifica se usuário deseja voltar ou continuar
		if [ "$SELECAO" == "0" ]
		  then
			$RCV $1
		else
			for i in "${SELECAO[@]}"; do
				#busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
				IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
				declare -a CSSHIP[i]=$IP
				echo "$IP"
			done
		fi
		clear
		#remove arquivos temporarios do scrip
		rm /tmp/temp.txt /tmp/temp1.txt
		#echo ${#CSSHIP[@]} 
		#verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
		if [ "${#CSSHIP[@]}" -gt "1" ]
		  then		
			#concatena o cssh com o usuário e com os ip's encontrados
			cssh -l rplat "${CSSHIP[@]}"
		else
			 #acessa ḿáquina selecionada na variavel IP
			ssh  rplat@"${CSSHIP[@]}"
		fi
	  ;;


        backura)   COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 5----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/loadBackUra.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]} 
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados
                        cssh -l rplat "${CSSHIP[@]}"
                else
                         #acessa ḿáquina selecionada na variavel IP
                        ssh rplat@"${CSSHIP[@]}"
                fi
          ;;

	     loadteste)   COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 5----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/loadteste.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]}
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados
                        cssh -l rplat "${CSSHIP[@]}"
                else
                         #acessa ḿáquina selecionada na variavel IP
                        ssh rplat@"${CSSHIP[@]}"
                fi
          ;;
rbt)     COND="0 /tmp/temp.txt"
                clear
                #laço para busca de palavras
                while [ "$COND" == "0 /tmp/temp.txt" ];do
                        echo "---------------------- ACESSO REMOTO VM's $1 1----------------------"
                        read -p "Entre com a busca: " MAQUINA
                        echo "Busca por: $MAQUINA"
                        echo "        NOME              IP SERVIÇO      IP GERENCIA     APLICAÇÕES"
                        #busca palavra ou ip dentro do arquivo de load e carrega resultado em temporario
                        grep -i "$MAQUINA" $CAMINHO/loadrbt.txt > /tmp/temp.txt
                        #verifica se arquivo gerado pela busca está vazio
                        COND=$(wc -l /tmp/temp.txt)
                        #imprime mensagem na tela e limpa
                        if [ "$COND" == "0 /tmp/temp.txt" ]
                          then
                                clear
                                echo "SUA BUSCA NÃO ENCONTROU RESULTADOS!"
                        fi
                        #enumera as buscas para serem utilizadas como menu/switch
                        nl -n ln /tmp/temp.txt > /tmp/temp1.txt
                        #exibe o resultado da busca
                        cat /tmp/temp1.txt
                        echo ""
                        echo "0 VOLTAR"
                done
                #recebe como parametro 1 ou mais números para encontrar os IP's dos servidores
                read -p"Selecione a máquina: " -a SELECAO
                echo ${SELECAO[@]}
                #verifica se usuário deseja voltar ou continuar
                if [ "$SELECAO" == "0" ]
                  then
                        $RCV $1
                else
                        for i in "${SELECAO[@]}"; do
                                #busca o IP dos servidores escolhidos na linha read acima e armazena-os em uma variável para usar no cssh
                                IP=$(grep -w "^$i" /tmp/temp1.txt | cut -f4)
                                declare -a CSSHIP[i]=$IP
                                echo "$IP"
                        done
                fi
                clear
                #remove arquivos temporarios do scrip
                rm /tmp/temp.txt /tmp/temp1.txt
                #echo ${#CSSHIP[@]} 
                #verifica se o acesso será para 1 ou mais servidores para utilizar o cssh ou apenas ssh
                if [ "${#CSSHIP[@]}" -gt "1" ]
                  then
                        #concatena o cssh com o usuário e com os ip's encontrados comando -l insere o usuário informado aos acessos

                        cssh -l $USR "${CSSHIP[@]}"
                else
                        #acessa ḿáquina selecionada na variavel IP
                        ssh $USR@"${CSSHIP[@]}"
                fi
          ;;


esac
 
