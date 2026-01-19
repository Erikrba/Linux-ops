# 02 - COMANDOS INTERMEDIÁRIOS DO LINUX

## INTRODUÇÃO

Este documento reúne **comandos intermediários do Linux**, voltados para usuários que já dominam os conceitos básicos e precisam atuar com mais eficiência em ambientes de servidores, operações, troubleshooting e automações simples.

É indicado para **Linux Ops**, **SysAdmin**, **DevOps iniciante** e ambientes corporativos.

## GERENCIAMENTO DE PROCESSOS (INTERMEDIÁRIO)

- **ps aux | grep processo**: Lista processos em execução e filtra por nome.
- **pgrep processo**: Retorna apenas o PID de processos pelo nome.
- **pkill processo**: Encerra processos diretamente pelo nome.
- **top -u usuario**: Mostra processos pertencentes a um usuário específico.
- **htop**: Monitoramento avançado e interativo de processos (requer instalação).
- **atop**: Monitoramento com histórico de uso de CPU, memória e disco.
- **watch -n 1 comando**: Executa um comando repetidamente a cada 1 segundo.

## CONTROLE DE PRIORIDADE DE PROCESSOS

- **nice -n 10 comando**: Executa um comando com prioridade mais baixa.
- **renice -n -5 PID**: Altera a prioridade de um processo em execução.
- **ps -eo pid,ni,cmd**: Lista processos exibindo prioridade (nice).

## DISCO, I/O E PERFORMANCE

- **iostat**: Mostra estatísticas de uso de CPU e I/O de disco.
- **iostat -x**: Exibe métricas detalhadas de latência e throughput.
- **iotop**: Mostra processos que mais consomem disco em tempo real.
- **df -i**: Exibe uso de inodes no sistema de arquivos.
- **du -sh * | sort -h**: Lista diretórios ordenados por tamanho.
- **find / -xdev -type f -size +1G**: Localiza arquivos maiores que 1GB.

## GERENCIAMENTO DE SERVIÇOS (systemd)

- **systemctl status serviço**: Exibe status detalhado do serviço.
- **systemctl start serviço**: Inicia um serviço.
- **systemctl stop serviço**: Interrompe um serviço.
- **systemctl restart serviço**: Reinicia o serviço.
- **systemctl reload serviço**: Recarrega configuração sem reiniciar.
- **systemctl enable serviço**: Ativa o serviço no boot.
- **systemctl disable serviço**: Remove serviço da inicialização.
- **systemctl list-units --type=service**: Lista serviços ativos.

## LOGS AVANÇADOS

- **journalctl --since "1 hour ago"**: Logs da última hora.
- **journalctl --since yesterday**: Logs desde o dia anterior.
- **journalctl -u serviço --since today**: Logs de um serviço específico.
- **journalctl -f**: Acompanha logs em tempo real.
- **journalctl --disk-usage**: Mostra espaço usado pelos logs.
- **journalctl --vacuum-time=7d**: Remove logs com mais de 7 dias.

## REDE (INTERMEDIÁRIO)

- **ip -s link**: Estatísticas detalhadas das interfaces de rede.
- **ss -s**: Resumo geral das conexões de rede.
- **ss -antp**: Lista conexões TCP com PID associado.
- **tcpdump -i eth0**: Captura pacotes da interface.
- **tcpdump -i eth0 port 80**: Captura tráfego HTTP.
- **nmap IP**: Escaneia portas abertas em um host.
- **curl -I URL**: Exibe apenas os cabeçalhos HTTP.
- **curl -v URL**: Mostra requisição e resposta detalhada.
- **wget URL**: Faz download de arquivos via terminal.

## USUÁRIOS E GRUPOS

- **useradd usuario**: Cria um novo usuário.
- **usermod -aG grupo usuario**: Adiciona usuário a um grupo.
- **passwd usuario**: Define ou altera senha.
- **groupadd grupo**: Cria um grupo.
- **id usuario**: Mostra UID, GID e grupos.
- **who**: Mostra usuários logados.
- **w**: Mostra usuários e processos ativos.
- **last**: Histórico de logins.

## PERMISSÕES AVANÇADAS

- **getfacl arquivo**: Exibe ACLs do arquivo.
- **setfacl -m u:usuario:rwx arquivo**: Define permissões ACL.
- **setfacl -R -m g:grupo:rx diretório**: ACL recursivo.
- **chmod -R 750 diretório**: Define permissões padrão.
- **chattr +i arquivo**: Torna arquivo imutável.
- **lsattr arquivo**: Lista atributos especiais.

## TAREFAS AGENDADAS

- **crontab -l**: Lista tarefas agendadas.
- **crontab -e**: Edita tarefas do usuário.
- **crontab -u usuario -e**: Edita tarefas de outro usuário.
- **/etc/crontab**: Arquivo global de agendamentos.
- **at 22:00**: Agenda comando para horário específico.
- **atq**: Lista tarefas do at.
- **atrm ID**: Remove tarefa agendada.

## VARIÁVEIS DE AMBIENTE

- **env**: Lista variáveis de ambiente.
- **printenv**: Exibe variáveis.
- **export VAR=valor**: Define variável.
- **echo $VAR**: Exibe valor da variável.
- **source ~/.bashrc**: Recarrega configurações do shell.
