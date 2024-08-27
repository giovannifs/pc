#!/bin/bash

BASE_DIR=$(dirname -- "$( readlink -f -- "$0"; )")

SERVER_ADRESS=150.165.85.31
SERVER_USER="concurrent"
PUBLIC_KEY_PATH="$BASE_DIR/keys/public_key.pem"
SSH_KEY="$BASE_DIR/keys/concurrent_ssh_key"

FILE_PATH=$1
FILE_NAME=$(basename $FILE_PATH .txt)

echo $BASE_DIR
echo $FILE_NAME

#ls -lh "~/.ssh/"

# Encrypting your answer file using the Public Key

echo openssl rsautl -encrypt -inkey $PUBLIC_KEY_PATH -pubin -in $FILE_PATH -out "$BASE_DIR/$FILE_NAME"-encrypted.bin

# Sending your encrypted answer file to the server

echo scp -i $SSH_KEY "$BASE_DIR/$FILE_NAME"-encrypted.bin" $SERVER_USER@$SERVER_ADRESS:/home/$SERVER_USER/concurrent-answers/24.1/prova2/
