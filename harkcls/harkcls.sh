#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "HarkCluster by SPARCie" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select system:" $HEIGHT $WIDTH 4 \
    "1" "VAX 11/780 AKA HRKV11" \
    "2" "VAX 8600 AKA HRKV86" \
    "3" "MicroVAX 3900 AKA HRKV39" \
    "4" "Serial to HRKAXP" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      telnet 127.0.0.1 11781 
      ;;
    2 )
      telnet 127.0.0.1 8600
      ;;
    3 )
      telnet 127.0.0.1 3900 
      ;;
    4 )
      sudo minicom -D /dev/ttyS3
      ;;
    5 )
      bash telnet.sh
      ;;
  esac
done
