#!/bin/bash

# Lista de usuários que queremos manter
KEEP_USERS=("USER")

# Converte a lista de usuários que queremos manter para um formato fácil de usar no script
keep_list=$(printf "|%s" "${KEEP_USERS[@]}")
keep_list="${keep_list:1}" # Remove o primeiro "|"

# Define o limite de UID para considerar apenas usuários normais
MIN_UID=1000

# Define o limite de dias de inatividade
INACTIVE_DAYS=180

# Define a data limite para inatividade
cutoff_date=$(date -d "$INACTIVE_DAYS days ago" +%Y-%m-%d)

# Array para armazenar usuários que serão deletados
DELETE_USERS=()

# Encontra todos os usuários do sistema com UID >= MIN_UID, excluindo os que estão na lista de exceção
for user in $(awk -v min_uid="$MIN_UID" -v keep="$keep_list" -F: '$3 >= min_uid && $1 !~ "("keep")" {print $1}' /etc/passwd); do
    # Verifica o último login pelo lastlog, forçando a localidade para inglês
    last_login_date=$(LC_ALL=C lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6}')

    # Se lastlog não tem data de login, considera que o usuário está inativo
    if [[ -z "$last_login_date" ]]; then
        echo "Usuário $user não possui histórico de login em lastlog. Marcado para exclusão."
        DELETE_USERS+=("$user")
    else
        # Converte a data de lastlog para um formato comparável
        last_login_date=$(date -d "$last_login_date" +%Y-%m-%d 2>/dev/null)

        # Se o último login for anterior à data limite, marca o usuário para exclusão
        if [[ "$last_login_date" < "$cutoff_date" ]]; then
            echo "Usuário $user está inativo desde $last_login_date. Marcado para exclusão."
            DELETE_USERS+=("$user")
        else
            echo "Usuário $user logou recentemente em $last_login_date. Ignorando."
        fi
    fi
done

# Exibe a lista final de usuários que serão deletados
if [ "${#DELETE_USERS[@]}" -gt 0 ]; then
    echo -e "\nUsuários que serão deletados:"
    printf '%s\n' "${DELETE_USERS[@]}"

        for user in "${DELETE_USERS[@]}"; do
            userdel -r "$user"
            echo "Usuário $user removido."
        done
else
    echo "Nenhum usuário para deletar."
fi

