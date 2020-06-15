dockerContainerId=$(docker ps --filter "name=postgres_db" --format "{{.ID}}")
echo $dockerContainerId

file="/mnt/c/backup/test1.sql"
clear
echo "Please enter the name of the database"
read name
echo $name
echo $file
docker exec -it $dockerContainerId psql -U postgres -d postgres -c "DROP DATABASE $name;"
docker exec -it $dockerContainerId psql -U postgres -d postgres -c "CREATE DATABASE $name;"
cat $file | docker exec -i $dockerContainerId psql -U postgres

echo $dockerContainerId
echo "Done!"