import json

# Nama file JSON
file_path = 'results.json'

# Membaca file JSON
with open(file_path, 'r') as file:
    data = json.load(file)
# Menyimpan IP dan port ke file teks
output_file_path = 'output.txt'

with open(output_file_path, 'w') as output_file:
    for entry in data:
        ip = entry.get('IP_Address')
        port = entry.get('Port')
        output_file.write(f"{ip}:{port}\n")

print(f"IP dan port telah disimpan ke {output_file_path}")