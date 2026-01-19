#!/usr/bin/env bash
set -euo pipefail

# --- CONFIGURE AQUI ---
SOURCE_AUTH_KEYS="$HOME/.ssh/authorized_keys" 
HOSTS_FILE="$1" #Declarar caminho do arquivo de maquinas na execucao do script    
SSH_CONNECT_USER="USER_CONEXAO"     # opcional: forçar usuário de conexão. Se vazio usa user@host do hosts file
SSH_PORT=22
TARGET_USER="SEU_USER"     # usuário alvo que terá login sem senha
# -----------------------

if [ ! -f "$SOURCE_AUTH_KEYS" ]; then
  echo "ERRO: arquivo fonte $SOURCE_AUTH_KEYS não encontrado."
  exit 1
fi
if [ ! -f "$HOSTS_FILE" ]; then
  echo "ERRO: arquivo de hosts $HOSTS_FILE não encontrado."
  exit 2
fi

# pede a senha uma vez (oculto)
read -s -p "Senha sudo de usuario de conexao (será usada para todos os hosts): " SUDO_PASS
echo

echo "Usando SOURCE_AUTH_KEYS=$SOURCE_AUTH_KEYS"
echo "Hosts: $(wc -l < "$HOSTS_FILE")"

while IFS= read -r hostline || [ -n "$hostline" ]; do
  # pular linhas vazias e comentários
  hostline="${hostline%%#*}"
  hostline="${hostline//[[:space:]]/}"
  [ -z "$hostline" ] && continue

  if [ -n "$SSH_CONNECT_USER" ]; then
    ssh_dest="${SSH_CONNECT_USER}@${hostline}"
  else
    ssh_dest="$hostline"
  fi

  echo
  echo "==== $ssh_dest ===="

  # 1) envia o arquivo de chaves para /tmp remoto (evita interpretar como comando)
  REMOTE_TMP="/tmp/ak_user_to_add.$$"
  if ! cat "$SOURCE_AUTH_KEYS" | ssh -p "$SSH_PORT" "$ssh_dest" "cat > '$REMOTE_TMP' && chmod 600 '$REMOTE_TMP'"; then
    echo "Erro: não foi possível enviar $SOURCE_AUTH_KEYS para $ssh_dest"
    continue
  fi
  echo "Arquivo temporário criado em $ssh_dest:$REMOTE_TMP"

  # 2) executa script remoto como root via sudo alimentando o sudo com a senha lida
  #    usamos uma subshell que primeiro imprime a senha (para sudo -S) e em seguida o conteúdo do script remoto
  (
    printf '%s\n' "$SUDO_PASS"
    cat <<'REMOTE_AS_ROOT'
set -euo pipefail
TARGET_USER="$1"
REMOTE_TMP="$2"

USER_HOME=$(getent passwd "$TARGET_USER" | cut -d: -f6 || true)
if [ -z "$USER_HOME" ]; then
  echo "ERRO: usuário $TARGET_USER não existe neste host."
  rm -f "$REMOTE_TMP"
  exit 3
fi

AUTH_DIR="$USER_HOME/.ssh"
AUTH_FILE="$AUTH_DIR/authorized_keys"

mkdir -p "$AUTH_DIR"
touch "$AUTH_FILE"

# backup
TIMESTAMP=$(date +%Y%m%d%H%M%S)
cp -p "$AUTH_FILE" "${AUTH_FILE}.bak.${TIMESTAMP}" || true
echo "Backup feito: ${AUTH_FILE}.bak.${TIMESTAMP}"

# concatena tmp ao authorized_keys
cat "$REMOTE_TMP" >> "$AUTH_FILE"

# remover duplicatas (sort -u pode reordenar)
sort -u "$AUTH_FILE" -o "$AUTH_FILE" || true

# ajustar permissões e owner
chmod 700 "$AUTH_DIR" || true
chmod 600 "$AUTH_FILE" || true
chown "$TARGET_USER":"$TARGET_USER" "$AUTH_DIR" "$AUTH_FILE" || true

rm -f "$REMOTE_TMP"

echo "OK (authorized_keys de $TARGET_USER atualizado)"
REMOTE_AS_ROOT
  ) | ssh -t -p "$SSH_PORT" "$ssh_dest" "sudo -S bash -s -- '$TARGET_USER' '$REMOTE_TMP'"

  rc=$?
  if [ $rc -ne 0 ]; then
    echo "Erro no host $ssh_dest (código $rc)."
  else
    echo "Concluído $ssh_dest"
  fi

done < "$HOSTS_FILE"

echo
echo "Fim do processamento."

