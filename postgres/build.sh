# Please note this script has specifically omitted
# the hash-bang bin/bash or bin/ash directive

echo
echo "---> Building cibi/postgres from $0"
echo
echo "Working directory: $(pwd)"
echo
docker build -t cibi/postgres ./postgres

