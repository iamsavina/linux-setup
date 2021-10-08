#!/bin/bash

error_handler() {
  echo "******* FAILED *******" 1>&2
  exit 1
}

trap error_handler ERR

sudo timedatectl set-timezone Asia/Colombo
echo -e "\e[1;32m Succesfully set timezone to UTC+530 \e[0m"

timedatectl