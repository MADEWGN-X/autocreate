#!/bin/bash

# Path ke file proxy
PROXY_FILE="proxy.txt"

# Periksa apakah file proxy ada
if [[ ! -f "$PROXY_FILE" ]]; then
    echo "File $PROXY_FILE tidak ditemukan!"
    exit 1
fi

# Loop melalui setiap proxy di file
while IFS= read -r PROXY; do
    # Tampilkan proxy yang sedang digunakan
    echo "Menggunakan proxy: $PROXY"

    # Atur proxy untuk skrip PHP
    export http_proxy="http://$PROXY"
    export https_proxy="http://$PROXY"

    # Jalankan skrip PHP
    php run.php

    # Hapus pengaturan proxy (opsional)
    unset http_proxy
    unset https_proxy

    # Beri jeda waktu (opsional)
    sleep 5
done < "$PROXY_FILE"

