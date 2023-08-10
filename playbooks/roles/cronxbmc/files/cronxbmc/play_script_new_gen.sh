#bin/bash
path=$1
body="[{\"jsonrpc\":\"2.0\",\"method\":\"Playlist.Insert\",\"params\":[0,0,{\"directory\":\"${path}\"}],\"id\":10}]"
curl 'http://127.0.0.1:8080/jsonrpc?Playlist.Clear' \
  -H 'Accept: text/plain, */*; q=0.01' \
  -H 'Accept-Language: en-GB,en;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6' \
  -H 'Authorization: Basic a29kaTptdXNpYzU2NzM=' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'DNT: 1' \
  -H 'Origin: http://127.0.0.1:8080' \
  -H 'Pragma: no-cache' \
  -H 'Referer: http://127.0.0.1:8080/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw '[{"jsonrpc":"2.0","method":"Playlist.Clear","params":[0],"id":25}]'

curl 'http://127.0.0.1:8080/jsonrpc?Playlist.Insert' \
  -H 'Accept: text/plain, */*; q=0.01' \
  -H 'Accept-Language: en-GB,en;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6' \
  -H 'Authorization: Basic a29kaTptdXNpYzU2NzM=' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'DNT: 1' \
  -H 'Origin: http://127.0.0.1:8080' \
  -H 'Pragma: no-cache' \
  -H 'Referer: http://127.0.0.1:8080/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "${body}" 

curl 'http://127.0.0.1:8080/jsonrpc?Player.Open' \
  -H 'Accept: text/plain, */*; q=0.01' \
  -H 'Accept-Language: en-GB,en;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6' \
  -H 'Authorization: Basic a29kaTptdXNpYzU2NzM=' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'DNT: 1' \
  -H 'Origin: http://127.0.0.1:8080' \
  -H 'Pragma: no-cache' \
  -H 'Referer: http://127.0.0.1:8080/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw '[{"jsonrpc":"2.0","method":"Player.Open","params":{"item":{"position":0,"playlistid":0},"options":{}},"id":27}]'
