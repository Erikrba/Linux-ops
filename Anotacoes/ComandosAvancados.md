# 03 - COMANDOS AVANÇADOS (PRODUÇÃO)

## INTRODUÇÃO

Este documento reúne **comandos avançados do Linux**, utilizados em **ambientes de produção**, troubleshooting crítico, análise de performance, resposta a incidentes e manutenção de sistemas de missão crítica.

⚠️ Use com cautela. Muitos comandos impactam diretamente o sistema.

## DEBUG E TROUBLESHOOTING AVANÇADO

- **strace -p PID**: Rastreia chamadas de sistema de um processo.
- **strace comando**: Debug detalhado da execução.
- **lsof**: Lista arquivos abertos por processos.
- **lsof -i :PORTA**: Identifica processo usando a porta.
- **fuser -n tcp PORTA**: Retorna PID que usa a porta.
- **perf top**: Analisa consumo de CPU em tempo real.
- **perf record / perf report**: Coleta e analisa eventos de performance.

## KERNEL E SISTEMA

- **uname -a**: Informações completas do kernel.
- **lsmod**: Lista módulos carregados.
- **modprobe modulo**: Carrega módulo do kernel.
- **sysctl -a**: Lista parâmetros do kernel.
- **sysctl -w parametro=valor**: Ajusta parâmetro em runtime.
- **/etc/sysctl.conf**: Persistência de parâmetros.
- **dmesg -T**: Logs do kernel com timestamp.
- **uptime**: Tempo ligado e carga média.

## MEMÓRIA E CPU (PRODUÇÃO)

- **cat /proc/loadavg**: Carga média do sistema.
- **mpstat -P ALL**: Uso de CPU por core.
- **numactl --hardware**: Informações NUMA.
- **free -h**: Uso de memória legível.
- **vmstat 1 10**: Estatísticas de memória e CPU.
- **slabtop**: Uso de cache do kernel.

## DISCO E FILESYSTEM (PRODUÇÃO)

- **mount | column -t**: Pontos de montagem organizados.
- **findmnt**: Exibe hierarquia de montagem.
- **tune2fs -l /dev/sdX**: Detalhes do filesystem EXT.
- **e2fsck -f /dev/sdX**: Verificação de filesystem.
- **resize2fs /dev/sdX**: Redimensiona filesystem EXT.
- **xfs_growfs /**: Expande filesystem XFS.
- **mount -o remount,rw /**: Remonta filesystem em escrita.

## BACKUP E RECOVERY

- **rsync -av origem destino**: Backup incremental.
- **rsync -av --delete origem destino**: Sincronização espelhada.
- **rsync -avz origem destino**: Backup com compressão.
- **dd if=/dev/sdX of=backup.img**: Backup bruto de disco.
- **dd if=backup.img of=/dev/sdX**: Restauração de disco.
- **tar --xattrs --acls -cvpf backup.tar diretório**: Backup preservando ACLs.

## SEGURANÇA E HARDENING

- **iptables -L -n -v**: Regras de firewall.
- **iptables-save**: Exporta regras.
- **firewall-cmd --list-all**: Regras ativas (firewalld).
- **firewall-cmd --add-port=80/tcp --permanent**: Libera porta.
- **firewall-cmd --reload**: Recarrega regras.
- **getenforce**: Status do SELinux.
- **setenforce 0**: Desativa SELinux temporariamente.
- **ausearch -m avc**: Logs de bloqueios SELinux.
- **semanage fcontext -l**: Contextos SELinux.

## SSH AVANÇADO

- **ssh -v usuario@host**: Debug de conexão SSH.
- **ssh -i chave usuario@host**: Usa chave específica.
- **ssh-copy-id usuario@host**: Copia chave pública.
- **scp arquivo usuario@host:/destino**: Cópia segura.
- **rsync -e ssh origem destino**: Sincronização via SSH.
- **ssh -L 8080:localhost:80 host**: Tunnel local.
- **ssh -R 9090:localhost:90 host**: Tunnel reverso.

## REDE AVANÇADA

- **tcpdump -nn -i eth0**: Captura sem resolução DNS.
- **tcpdump -i eth0 -w captura.pcap**: Salva captura.
- **tshark -i any**: Captura via terminal.
- **ethtool eth0**: Info da interface.
- **ethtool -k eth0**: Offloads da placa.
- **ip neigh**: Tabela ARP.
- **arp -n**: Cache ARP.

## AUTOMATIZAÇÃO E SHELL

- **set -x**: Debug de script.
- **set -e**: Interrompe script em erro.
- **trap comando EXIT**: Executa ação ao sair.
- **xargs**: Passa saída como argumento.
- **parallel**: Execução paralela.
- **awk '{print $1}'**: Processamento de texto.
- **sed -i 's/antigo/novo/g' arquivo**: Substituição em massa.

## CONTÊINERES (BASE OPS)

- **docker ps**: Containers ativos.
- **docker logs container**: Logs do container.
- **docker exec -it container bash**: Acesso interativo.
- **docker stats**: Uso de recursos.
- **docker inspect container**: Detalhes do container.

## OBSERVAÇÕES FINAIS

Este material é voltado para ambientes produtivos.
Sempre teste comandos em ambientes de homologação antes de produção.

---
