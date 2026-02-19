#!/bin/bash
# Si Hubstaff está en ejecución, abrir en Firefox
if pgrep -x "hubstaff" > /dev/null; then
    firefox "$1"
else
    google-chrome-stable "$1"
fi
