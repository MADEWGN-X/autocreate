#!/bin/bash

# Daftar proxy Anda
PROXIES=(
    "198.23.239.134:6540:hpxootxe:htffb8pntxgd"
    "207.244.217.165:6712:hpxootxe:htffb8pntxgd"
    "107.172.163.27:6543:hpxootxe:htffb8pntxgd"
    "64.137.42.112:5157:hpxootxe:htffb8pntxgd"
    "173.211.0.148:6641:hpxootxe:htffb8pntxgd"
    "161.123.152.115:6360:hpxootxe:htffb8pntxgd"
    "167.160.180.203:6754:hpxootxe:htffb8pntxgd"
    "154.36.110.199:6853:hpxootxe:htffb8pntxgd"
    "173.0.9.70:5653:hpxootxe:htffb8pntxgd"
    "173.0.9.209:5792:hpxootxe:htffb8pntxgd"
)

# Loop sebanyak jumlah proxy
for PROXY in "${PROXIES[@]}"; do
    # Pecahkan proxy menjadi bagian-bagian
    IP=$(echo $PROXY | cut -d':' -f1)
    PORT=$(echo $PROXY | cut -d':' -f2)
    USERNAME=$(echo $PROXY | cut -d':' -f3)
    PASSWORD=$(echo $PROXY | cut -d':' -f4)

    # Tampilkan proxy yang digunakan
    echo "Menggunakan proxy: $IP:$PORT"

    # Atur proxy untuk skrip PHP
    export http_proxy="http://$USERNAME:$PASSWORD@$IP:$PORT"
    export https_proxy="http://$USERNAME:$PASSWORD@$IP:$PORT"

    # Jalankan skrip PHP
    php run.php

    # Hapus pengaturan proxy (opsional, untuk menghindari konflik di iterasi berikutnya)
    unset http_proxy
    unset https_proxy

    # Beri jeda waktu (opsional)
    sleep 5
done

