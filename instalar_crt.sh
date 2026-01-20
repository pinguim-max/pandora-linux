#!/bin/bash

TARGET="/userdata/system/Batocera-CRT-Script/Batocera_ALLINONE/crt"

if [ ! -f "$TARGET" ]; then
    # Baixa e instala silenciosamente
    wget https://github.com/JeversonDiasSilva/Batocera-40-CRT/releases/download/v1.0/CRT -qO /tmp/CRT
    unsquashfs -d /userdata/system/Batocera-CRT-Script /tmp/CRT > /dev/null 2>&1
    rm -f /tmp/CRT
    chmod -R 777 "/userdata/system/Batocera-CRT-Script"
fi

# Executa o programa bloqueando TODAS as saídas (texto normal e erros)
"$TARGET" > /dev/null 2>&1
