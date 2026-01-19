# 01 - COMANDOS ESSENCIAIS DO LINUX
 
## INTRODUÇÃO
 
**Este documento reúne comandos essenciais do Linux**, amplamente utilizados no dia a dia de administração de sistemas, operações, troubleshooting e suporte.
 
O conteúdo é direto, organizado por categorias e serve como **material de consulta rápida**.
 
## ABRINDO O PROMPT
 
- **Abrir o terminal no Linux:** `<Ctrl> + <Alt> + <T>`  
- **Limpar a tela do terminal:** `clear`  
- **Cancelar um comando em execução:** `<Ctrl> + C`  
- **Executar o último comando novamente:** `!!`  
 
## COMANDOS DE NAVEGAÇÃO E ARQUIVOS
 
- **ls**: Lista arquivos e diretórios da pasta atual.  
- **ls -lh**: Lista arquivos com detalhes e tamanho legível.  
- **cd [diretório]**: Acessa o diretório especificado.  
- **cd**: Vai para o diretório HOME do usuário.  
- **pwd**: Mostra o caminho completo do diretório atual.  
- **clear**: Limpa a tela do terminal.  
- **cat [arquivo]**: Exibe o conteúdo de um arquivo.  
- **less [arquivo]**: Visualiza arquivos grandes com navegação.  
- **| more**: Pagina a saída de um comando linha a linha.  
- **head [arquivo]**: Mostra as primeiras linhas do arquivo.  
- **tail [arquivo]**: Mostra as últimas linhas do arquivo.  
- **tail -f [arquivo]**: Acompanha o crescimento do arquivo em tempo real.  
 
## COMANDOS DE DIRETÓRIOS E MANIPULAÇÃO DE ARQUIVOS
 
- **mkdir [nome]**: Cria um diretório.  
- **mkdir -p dir/subdir**: Cria diretórios de forma recursiva.  
- **rmdir [nome]**: Remove um diretório vazio.  
- **rm [arquivo]**: Remove um arquivo.  
- **rm -r [diretório]**: Remove um diretório e seu conteúdo.  
- **rm -f [arquivo]**: Remove um arquivo sem confirmação.  
- **mv [origem] [destino]**: Move ou renomeia arquivos e diretórios.  
- **cp [origem] [destino]**: Copia arquivos.  
- **cp -r [origem] [destino]**: Copia diretórios recursivamente.  
 
## COMANDOS DE DESLIGAMENTO E REINÍCIO
 
- **shutdown**: Agenda o desligamento do sistema.  
- **shutdown now**: Desliga o sistema imediatamente.  
- **shutdown -r now**: Reinicia imediatamente.  
- **shutdown -h now**: Desliga e encerra o sistema corretamente.  
 
## EXECUÇÃO EM BACKGROUND
 
- **&**: Executa um comando em background, permitindo continuar usando o terminal enquanto o comando é processado.
 
---
