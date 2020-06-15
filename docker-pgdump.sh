dockerContainerId=$(docker ps --filter "name=postgres_db" --format "{{.ID}}")
echo $dockerContainerId

file="/mnt/c/backup/test1.sql"
[ -f $file ] && rm $file

docker exec -t $dockerContainerId pg_dumpall -c -U postgres > $file