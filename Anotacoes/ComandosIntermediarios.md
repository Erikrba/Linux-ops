# 02 - COMANDOS INTERMEDIÁRIOS DO LINUX

## INTRODUÇÃO

Este documento reúne **comandos intermediários do Linux**, voltados para quem já domina o básico e precisa atuar com mais eficiência em ambientes de servidores, operações, troubleshooting e automações simples.

Ideal para **Linux Ops**, **SysAdmin**, **DevOps iniciante** e ambientes corporativos.

## GERENCIAMENTO DE PROCESSOS (INTERMEDIÁRIO)

- **ps aux | grep processo**: Filtra processos específicos.
- **pgrep processo**: Retorna o PID de um processo.
- **pkill processo**: Encerra processo pelo nome.
- **top -u usuario**: Mostra processos de um usuário.
- **htop**: Monitoramento avançado (requer instalação).
- **atop**: Monitoramento histórico de recursos.
- **watch -n 1 comando**: Executa comando a cada segundo.

## CONTROLE DE PRIORIDADE DE PROCESSOS

- **nice -n 10 comando**: Executa comando com menor prioridade.
- **renice -n -5 PID**: Altera prioridade de processo em execução.
- **ps -eo pid,ni,cmd**: Exibe prioridade dos processos.

## DISCO, I/O E PERFORMANCE

- **iostat**: Estatísticas de I/O.
- **iostat -x**: Detalhes avançados de disco.
- **iotop**: Mostra processos que mais usam disco.
- **df -i**: Uso de inodes.
- **du -sh * | sort -h**: Ordena diretórios por tamanho.
- **find / -xdev -type f -size +1G**: Busca arquivos grandes.

## GERENCIAMENTO DE SERVIÇOS (systemd)

- **systemctl status serviço**: Status do serviço.
- **systemctl start serviço**: Inicia serviço.
- **systemctl stop serviço**: Para serviço.
- **systemctl restart serviço**: Reinicia serviço.
- **systemctl reload serviço**: Recarrega configuração.
- **systemctl enable serviço**: Ativa serviço no boot.
- **systemctl disable serviço**: Remove serviço do boot.
- **systemctl list-units --type=service**: Lista serviços ativos.

## LOGS AVANÇADOS

- **journalctl --since "1 hour ago"**
- **journalctl --since yesterday**
- **journalctl -u serviço --since today**
- **journalctl -f**: Acompanha logs em tempo real
- **journalctl --disk-usage**: Uso de disco pelos logs
- **journalctl --vacuum-time=7d**: Limpa logs antigos

## REDE (INTERMEDIÁRIO)

- **ip -s link**: Estatísticas de interfaces.
- **ss -s**: Resumo de conexões.
- **ss -antp**: Conexões TCP detalhadas.
- **tcpdump -i eth0**: Captura pacotes.
- **tcpdump -i eth0 port 80**: Captura tráfego HTTP.
- **nmap IP**: Varredura de portas.
- **curl -I URL**: Cabeçalhos HTTP.
- **curl -v URL**: Requisição detalhada.
- **wget URL**: Download via terminal.

## USUÁRIOS E GRUPOS

- **useradd usuario**
- **usermod -aG grupo usuario**
- **passwd usuario**
- **groupadd grupo**
- **id usuario**
- **who**
- **w**
- **last**

## PERMISSÕES AVANÇADAS

- **getfacl arquivo**
- **setfacl -m u:usuario:rwx arquivo**
- **setfacl -R -m g:grupo:rx diretório**
- **chmod -R 750 diretório**
- **chattr +i arquivo**: Torna arquivo imutável
- **lsattr arquivo**

## TAREFAS AGENDADAS

- **crontab -l**
- **crontab -e**
- **crontab -u usuario -e**
- **/etc/crontab**
- **at 22:00**
- **atq**
- **atrm ID**

## VARIÁVEIS DE AMBIENTE

- **env**
- **printenv**
- **export VAR=valor**
- **echo $VAR**
- **source ~/.bashrc**

## OBSERVAÇÕES

Estes comandos são amplamente usados em ambientes produtivos e exigem atenção, principalmente em sistemas compartilhados.

---
