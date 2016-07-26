#!/usr/bin/env bash

set -e
set -u
set -o pipefail
standardIFS="$IFS"
IFS=$'\n\t'
echo "
===========================================
$(hostname) $0 $@
===========================================
"


#### VARIABLES ####
dirProjectRoot="$(realpath $DIR/../../../../)";
dirVar="$dirProjectRoot/var";