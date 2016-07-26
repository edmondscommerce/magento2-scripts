#!/usr/bin/env bash

if [[ -z "$DIR" ]]
then
    readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
fi

cd $DIR;
source ./_top.inc.bash;


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