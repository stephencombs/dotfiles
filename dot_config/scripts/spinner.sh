#!/bin/bash

spinner_pid=

start_spinner() {
        # start the spinner
        set +m
        local message=$1
        /bin/echo -en "$message...   "
        # { while : ; do for X in '-' '\' '|' '/' ; do /bin/echo -en "\b$X" ; sleep 0.1 ; done ; done & } 2>/dev/null
        # { while : ; do for X in '┤' '┘' '┴' '└' '├' '┌' '┬' '┐' ; do /bin/echo -en "\b$X" ; sleep 0.1 ; done ; done & } 2>/dev/null
        { while : ; do for X in '  •     ' '   •    ' '    •   ' '     •  ' '      • ' '     •  ' '    •   ' '   •    ' '  •     ' ' •      ' ; do /bin/echo -en "\b\b\b\b\b\b\b\b$X" ; sleep 0.1 ; done ; done & } 2>/dev/null
        spinner_pid=$!
}

stop_spinner() {
        # stop the spinner
        { kill -9 "$spinner_pid" && wait; } 2>/dev/null
        set -m
        /bin/echo -ne "\r"
}

trap stop_spinner EXIT
