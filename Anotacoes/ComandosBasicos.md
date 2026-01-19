** COMANDOS UTEIS PARA LINUX **

- Comando para ver qual o processador da maquina direto pelo terminal:
cat /proc/cpuinfo | grep processor | wc -l

Uso da CPU (sar -u)
Uso de memória (sar -r)
Uso do espaço de swap (sar -S)
Atividade individual de cada dispositivo de I/O (sar -d)
Atividade da fila de execução de processos e carga (sar -q)

- Comando para listar memoria RAM, Disco e CPU da maquina atual
echo 'RAM (MB):'; free -m | awk 'NR==2{mem = $2}END{print mem}'; echo 'Disk (GB)':; df -P | awk 'NR>1{sum+=$2}END{print sum/(1024*1024)}'; cat /proc/cpuinfo | awk '{ if ($2 ~ /cores/) print }'

- Comando para capturar todos os pacotes que passam pela maquina atual

tshark -i any -w analise.pcap

- Comando para testar conexao em uma porta especifica

telnet IP PORTA
Ex: Telnet 10.99.99.10 1521

- Comando para descobrir IP via DNS

nslookup URL
Ex: nslookup google.com

- Comando para acompanhar as ultimas linhas de um arquivo

tail -f caminho do arquivo
Ex: tail -f /opt/dados/jboss-server/log/server.log

- Limpar arquivos antigos (liberar espaço/logs):

find /<dir>* -mtime +90 -exec rm {} \;

- Liberar memoria ram (Limpar o PageCache, dentries e inodes):

sync; echo 3 > /proc/sys/vm/drop_caches

- FIND Palavras em arquivos:

find / -exec grep -l "word" {} \;

find /diretorio/ -name "*.config" -exec grep -l -i "word" {} \;


