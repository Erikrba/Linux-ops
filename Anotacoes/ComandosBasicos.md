# 01 - COMANDOS ESSENCIAIS DO LINUX

## INTRODUÇÃO

**Este documento reúne comandos essenciais do Linux**, amplamente utilizados no dia a dia de administração de sistemas, operações, troubleshooting e suporte.

O conteúdo é direto, organizado por categorias e serve como **material de consulta rápida** para ambientes Linux.

## ABRINDO O PROMPT

- **Abrir o terminal no Linux:** `<Ctrl> + <Alt> + <T>`
- **Limpar a tela do terminal:** `clear`
- **Cancelar um comando em execução:** `<Ctrl> + C`
- **Executar o último comando novamente:** `!!`
- **Executar comandos como superusuário:** `sudo comando`
- **Trocar para o usuário root:** `su` ou `su -`

## COMANDOS DE NAVEGAÇÃO E ARQUIVOS

- **ls**: Lista arquivos e diretórios da pasta atual.
- **ls -l**: Lista arquivos com permissões e detalhes.
- **ls -lh**: Lista arquivos com tamanho legível.
- **ls -a**: Lista arquivos ocultos.
- **cd [diretório]**: Acessa o diretório especificado.
- **cd ..**: Volta um nível no diretório.
- **cd**: Vai para o diretório HOME do usuário.
- **pwd**: Mostra o caminho completo do diretório atual.
- **clear**: Limpa a tela do terminal.
- **tree**: Exibe diretórios em formato de árvore.
- **stat [arquivo]**: Mostra detalhes completos de um arquivo.

## VISUALIZAÇÃO DE ARQUIVOS

- **cat [arquivo]**: Exibe o conteúdo de um arquivo.
- **less [arquivo]**: Visualiza arquivos grandes com navegação.
- **more [arquivo]**: Pagina a saída de um arquivo.
- **head [arquivo]**: Mostra as primeiras linhas do arquivo.
- **head -n 20 [arquivo]**: Mostra as primeiras 20 linhas.
- **tail [arquivo]**: Mostra as últimas linhas do arquivo.
- **tail -n 50 [arquivo]**: Mostra as últimas 50 linhas.
- **tail -f [arquivo]**: Acompanha o crescimento do arquivo em tempo real.

## COMANDOS DE DIRETÓRIOS E MANIPULAÇÃO DE ARQUIVOS

- **mkdir [nome]**: Cria um diretório.
- **mkdir -p dir/subdir**: Cria diretórios de forma recursiva.
- **rmdir [nome]**: Remove um diretório vazio.
- **rm [arquivo]**: Remove um arquivo.
- **rm -r [diretório]**: Remove um diretório e seu conteúdo.
- **rm -rf [diretório]**: Remove diretório sem confirmação (CUIDADO).
- **rm -f [arquivo]**: Remove um arquivo sem confirmação.
- **mv [origem] [destino]**: Move ou renomeia arquivos e diretórios.
- **cp [origem] [destino]**: Copia arquivos.
- **cp -r [origem] [destino]**: Copia diretórios recursivamente.
- **ln -s [origem] [link]**: Cria link simbólico.

## PERMISSÕES E PROPRIEDADES DE ARQUIVOS

- **ls -l**: Exibe permissões de arquivos.
- **chmod 755 [arquivo]**: Altera permissões do arquivo.
- **chmod +x [arquivo]**: Torna o arquivo executável.
- **chown usuario:grupo [arquivo]**: Altera dono e grupo.
- **chown -R usuario:grupo [diretório]**: Altera dono recursivamente.
- **umask**: Mostra máscara de permissões padrão.

## COMANDOS DE DESLIGAMENTO E REINÍCIO

- **shutdown**: Agenda o desligamento do sistema.
- **shutdown now**: Desliga o sistema imediatamente.
- **shutdown -r now**: Reinicia imediatamente.
- **shutdown -h now**: Desliga e encerra o sistema corretamente.
- **reboot**: Reinicia o sistema (uso emergencial).
- **poweroff**: Desliga o sistema imediatamente.

## EXECUÇÃO EM BACKGROUND E JOBS

- **&**: Executa comando em background.
- **jobs**: Lista processos em background.
- **fg %1**: Traz o job para foreground.
- **bg %1**: Continua job em background.
- **nohup comando &**: Executa comando mesmo após logout.

## COMANDOS DE PROCESSOS E SISTEMA

- **ps**: Lista processos do usuário.
- **ps aux**: Lista todos os processos do sistema.
- **top**: Exibe processos em tempo real.
- **htop**: Monitoramento avançado de processos.
- **kill [PID]**: Encerra processo pelo ID.
- **kill -9 [PID]**: Força encerramento do processo.
- **uptime**: Mostra tempo ligado e carga do sistema.
- **watch comando**: Executa comando periodicamente.

## MEMÓRIA, CPU E HARDWARE

- **free**: Mostra uso de memória.
- **free -h**: Mostra memória em formato legível.
- **vmstat**: Estatísticas de memória e processos.
- **lscpu**: Informações da CPU.
- **lsmem**: Informações de memória.
- **cat /proc/cpuinfo**: Detalhes da CPU.
- **cat /proc/meminfo**: Detalhes da memória.

## DISCO E FILESYSTEM

- **df**: Mostra uso das partições.
- **df -h**: Mostra uso do disco de forma legível.
- **du -sh [diretório]**: Mostra tamanho do diretório.
- **du -h / | sort -hr | head**: Diretórios mais pesados.
- **lsblk**: Lista discos e partições.
- **mount**: Lista sistemas montados.
- **umount [dispositivo]**: Desmonta filesystem.
- **blkid**: Mostra UUIDs dos discos.

## REDE E CONECTIVIDADE

- **ip a**: Mostra interfaces de rede.
- **ip route**: Mostra rotas.
- **ping [host]**: Testa conectividade.
- **traceroute [host]**: Rastreia rota de rede.
- **nslookup [domínio]**: Consulta DNS.
- **dig [domínio]**: Consulta DNS detalhada.
- **ss -tulnp**: Lista portas abertas.
- **netstat -tulnp**: Lista portas (legado).
- **telnet IP PORTA**: Testa conexão em uma porta.
- **nc -zv IP PORTA**: Testa porta com netcat.

## LOGS E TROUBLESHOOTING

- **dmesg**: Mostra mensagens do kernel.
- **journalctl**: Logs do systemd.
- **journalctl -xe**: Logs detalhados de erro.
- **journalctl -u serviço**: Logs de um serviço.
- **tail -f /var/log/syslog**: Acompanha logs do sistema.
- **tail -f /var/log/messages**: Logs gerais (RHEL/CentOS).

## BUSCA E FILTRAGEM

- **find / -name arquivo**: Procura arquivo no sistema.
- **find / -size +100M**: Procura arquivos grandes.
- **grep palavra arquivo**: Busca texto em arquivo.
- **grep -R palavra /diretório**: Busca texto recursivamente.
- **grep -i palavra arquivo**: Ignora maiúsculas/minúsculas.
- **awk**: Manipulação avançada de texto.
- **sed**: Edição de texto em linha de comando.

## COMPACTAÇÃO E BACKUP

- **tar -cvf backup.tar diretório**: Cria backup.
- **tar -xvf backup.tar**: Restaura backup.
- **tar -tvf backup.tar**: Lista conteúdo do backup.
- **gzip arquivo**: Compacta arquivo.
- **gunzip arquivo.gz**: Descompacta arquivo.
- **zip -r backup.zip diretório**: Compacta em zip.
- **unzip backup.zip**: Descompacta zip.

## LIMPEZA E MANUTENÇÃO

- **find /diretorio -mtime +90 -exec rm -f {} \\;**: Remove arquivos antigos.
- **sync; echo 3 > /proc/sys/vm/drop_caches**: Limpa cache de memória.
- **crontab -l**: Lista tarefas agendadas.
- **crontab -e**: Edita tarefas agendadas.

## OBSERVAÇÕES FINAIS

Este material foi criado para uso prático em ambientes Linux, servindo como referência rápida para operações do dia a dia.

Comandos destrutivos devem ser usados com extrema cautela, principalmente em ambientes de produção.

---
