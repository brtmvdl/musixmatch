#!/usr/bin/sh

# before

method="album.get"

echo
echo "method: ${method}"
echo

echo musixmatch album_id:

read album_id

# while

resp=$( bash musixmatch.sh "${method}" "album_id=${album_id}" | jq )

# after

bash create_file.sh "./data/musixmatch/${method}/${album_id}/" "album_id" "${album_id}"

bash create_file.sh "./data/musixmatch/${method}/${album_id}/" "json" "${resp}"