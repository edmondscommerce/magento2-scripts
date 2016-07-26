#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [[ $? != 0 ]]
then
    echo "Failed cd-ing into the the binaries folder, aborting"
    exit 1
fi

source $DIR/_top.inc.bash;


mkdir -p "$dirVar/page_cache";

echo "Finding files to update permissions ...";

function fixMagentoPermissionsForDir()
{
    local dirChange=$1;
    chmod -R 777 "$dirChange"; #TODO Replace with chown and env file for web user
}

arrDirToChange=(
"$dirVar/page_cache"
"$dirVar/cache"
"$dirVar/cache/*"
"$dirVar/generation"
"$dirVar/generation/*"
"$dirVar/log"
"$dirVar/log/*.log"
);

for d in "${arrDirToChange[@]}"
do
    echo "Fixing: $d";
    fixMagentoPermissionsForDir "$d";
done