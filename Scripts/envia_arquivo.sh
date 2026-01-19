#!/bin/bash

ARQUIVO=$1 # Arquivo a ser copiado (primeiro argumento)
MAQUINAS=$2 # Arquivo de maquinas (Segundo argumento)
USER=SEU_USER #Seu user para logar nas maquinas
PSSWD=SUA_SENHA #Sua senha de usuario

#Arquivos de log
LOG_SUCESSO=$HOME/exec-sucesso.txt
LOG_FALHA=$HOME/exec-falha.txt

#Limpa os arquivos de log
> "$LOG_SUCESSO"
> "$LOG_FALHA"

while IFS= read -r MAQUINA; do
    echo "Copiando para $MAQUINA..."
    if sshpass -p "$PSSWD" scp "$ARQUIVO" "$USER@$MAQUINA:/tmp/"; then
        echo "Arquivo copiado para $MAQUINA:/tmp/" >> "$LOG_SUCESSO"
    else
        echo "Falha ao copiar para $MAQUINA" >> "$LOG_FALHA"
    fi
done < "$MAQUINAS"
