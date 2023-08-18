#!/usr/bin/sh

# inputs

. .env

method="track.search"

echo
echo "method: ${method}"
echo

echo musixmatch artist:

artist=

if [[ -z "${artist}" ]]; then
  artist="${1}"
fi

q_artist=$( echo "${artist}" | sed -e 's/ /+/ig' )

echo
echo "q_artist: ${q_artist}"
echo

# runner

resp=$( bash musixmatch.sh "${method}" "page_size=80&q_artist=${q_artist}" | jq )

# outputs

bash create_file.sh "${method}" "${q_artist}" "q_artist" "${q_artist}"

bash create_file.sh "${method}" "${q_artist}" "json" "${resp}"
