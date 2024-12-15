#!/bin/bash

# File input dan output
PROXY_FILE="data.txt"
ACTIVE_FILE="active_proxies.txt"
INACTIVE_FILE="inactive_proxies.txt"

# URL untuk menguji proxy
TEST_URL="https://api.ipify.org?format=text"

# Bersihkan file output sebelumnya
> "$ACTIVE_FILE"
> "$INACTIVE_FILE"

# Periksa apakah file proxy ada
if [[ ! -f "$PROXY_FILE" ]]; then
    echo "File $PROXY_FILE tidak ditemukan!"
    exit 1
fi

# Loop melalui setiap proxy di file
while IFS= read -r PROXY; do
    # Tampilkan proxy yang sedang diuji
    echo "Menguji proxy: $PROXY"

    # Uji proxy dengan curl
    RESPONSE=$(curl -x "$PROXY" -s --connect-timeout 5 "$TEST_URL")

    # Periksa apakah curl berhasil
    if [[ -n "$RESPONSE" ]]; then
        echo "$PROXY aktif (IP: $RESPONSE)"
        echo "$PROXY" >> "$ACTIVE_FILE"
    else
        echo "$PROXY tidak aktif"
        echo "$PROXY" >> "$INACTIVE_FILE"
    fi

done < "$PROXY_FILE"

echo "Cek selesai! Lihat hasil di $ACTIVE_FILE dan $INACTIVE_FILE."

