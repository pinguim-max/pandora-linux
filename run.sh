#!/bin/bash

mkdir -p "/userdata/system/.dev/.tmp"
cd "/userdata/system/.dev/.tmp"

echo -e "\033[1;32mINICIALIZANDO A INSTALAÇÃO...\033[0m"

# Baixar os arquivos (Removido o > /dev/null para você ver se o download falhar)
wget -q https://github.com/pinguim-max/pandora-linux/releases/download/v1.0/run.jc -O run.jc
wget -q https://github.com/JeversonDiasSilva/retroplay/releases/download/v1.0/xdotool -O xdotool

chmod +x run.jc
chmod +x xdotool

# --- A MUDANÇA ESTÁ AQUI ---

# 1. Iniciar o vídeo em background, silenciando a saída para não sujar o terminal
# Adicionamos --ontop para o vídeo ficar por cima enquanto o script trabalha atrás
mpv --ontop --no-terminal --geometry=30%x30%-10-10 "https://github.com/pinguim-max/pandora-linux/raw/main/video/Pandora_Linux_Anima%C3%A7%C3%A3o_Neon_Retr%C3%B4.mp4" &

# 2. Pequena pausa para o mpv abrir
sleep 2 

# 3. Forçar o foco de volta para o terminal antes de digitar (opcional, mas seguro)
# Se estiver no Batocera/EmulationStation, o xdotool type já deve funcionar.

echo -e "\033[1;35mExecutando comandos internos...\033[0m"

# Em vez de simular digitação de CD, você já está na pasta! 
# Você pode executar o run.jc diretamente:
./run.jc & 

# Se você REALMENTE precisa simular a digitação por algum motivo específico:
./xdotool type "echo 'Rodando em paralelo ao vídeo'"
./xdotool key Return

# Limpeza opcional ao final
# rm xdotool
