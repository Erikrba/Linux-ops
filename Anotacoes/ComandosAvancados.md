# 03 - COMANDOS AVANÇADOS (PRODUÇÃO)

## INTRODUÇÃO

Este documento reúne **comandos avançados do Linux**, utilizados em **ambientes de produção**, troubleshooting crítico, análise de performance, incidentes e manutenção de sistemas de missão crítica.

⚠️ Muitos comandos aqui **podem impactar o sistema**. Use com cautela.

## DEBUG E TROUBLESHOOTING AVANÇADO

- **strace -p PID**: Rastreia chamadas de sistema.
- **strace comando**: Debug de execução.
- **lsof**: Lista arquivos abertos.
- **lsof -i :PORTA**: Descobre processo usando porta.
- **fuser -n tcp PORTA**: Processo usando porta.
- **perf top**: Análise de performance da CPU.
- **perf record / perf report**

## KERNEL E SISTEMA

- **uname -a**
- **lsmod**
- **modprobe modulo**
- **sysctl -a**
- **sysctl -w parametro=valor**
- **/etc/sysctl.conf**
- **dmesg -T**
- **uptime**
- **free -m**
- **vmstat 1**

## MEMÓRIA E CPU (PRODUÇÃO)

- **cat /proc/loadavg**
- **mpstat -P ALL**
- **numactl --hardware**
- **free -h**
- **vmstat 1 10**
- **slabtop**

## DISCO E FILESYSTEM (PRODUÇÃO)

- **mount | column -t**
- **findmnt**
- **tune2fs -l /dev/sdX**
- **e2fsck -f /dev/sdX**
- **resize2fs /dev/sdX**
- **xfs_growfs /**
- **mount -o remount,rw /**

## BACKUP E RECOVERY

- **rsync -av origem destino**
- **rsync -av --delete origem destino**
- **rsync -avz origem destino**
- **dd if=/dev/sdX of=backup.img**
- **dd if=backup.img of=/dev/sdX**
- **tar --xattrs --acls -cvpf backup.tar diretório**

## SEGURANÇA E HARDENING

- **iptables -L -n -v**
- **iptables-save**
- **firewall-cmd --list-all**
- **firewall-cmd --add-port=80/tcp --permanent**
- **firewall-cmd --reload**
- **getenforce**
- **setenforce 0**
- **ausearch -m avc**
- **semanage fcontext -l**

## SSH AVANÇADO

- **ssh -v usuario@host**
- **ssh -i chave usuario@host**
- **ssh-copy-id usuario@host**
- **scp arquivo usuario@host:/destino**
- **rsync -e ssh origem destino**
- **ssh -L 8080:localhost:80 host**
- **ssh -R 9090:localhost:90 host**

## REDE AVANÇADA

- **tcpdump -nn -i eth0**
- **tcpdump -i eth0 -w captura.pcap**
- **tshark -i any**
- **ethtool eth0**
- **ethtool -k eth0**
- **ip neigh**
- **arp -n**

## AUTOMATIZAÇÃO E SHELL

- **set -x**: Debug de script
- **set -e**: Interrompe script em erro
- **trap comando EXIT**
- **xargs**
- **parallel**
- **awk '{print $1}'**
- **sed -i 's/antigo/novo/g' arquivo**

## CONTÊINERES (BASE OPS)

- **docker ps**
- **docker logs container**
- **docker exec -it container bash**
- **docker stats**
- **docker inspect container**

## OBSERVAÇÕES FINAIS

Este material é voltado para profissionais que atuam diretamente em ambientes produtivos.

Sempre valide comandos em ambientes de teste antes de aplicar em produção.

---
