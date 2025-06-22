#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "DECbox by SPARCie" \
    --title "DECServer sessions" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select system:" $HEIGHT $WIDTH 4 \
    "1" "The DECServer itself" \
    "2" "Sun T5120" \
    "3" "Sun T5220" \
    "4" "Alphaserver DS20E" \
    "5" "Alphaserver DS25" \
    "6" "Alphaserver ES47" \
    "7" "Router" \
    "8" "Switch" \
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
      telnet 192.168.16.5 23
      ;;
    2 )
      telnet 192.168.16.5 2002
      ;;
    3 )
      telnet 192.168.16.5 2003
      ;;
    4 )
      telnet 192.168.16.5 2004
      ;;
    5 )
      telnet 192.168.16.5 2005
      ;;
    6 )
      telnet 192.168.16.5 2006
      ;;
    7 )
      telnet 192.168.16.5 2007
      ;;
    8 )
      telnet 192.168.16.5 2008
      ;;
  esac
done
