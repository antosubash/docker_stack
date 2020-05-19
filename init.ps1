Write-Output "Swarm Init"
docker swarm init

Write-Output "Creating volumes"
docker volume create mysql

docker volume create postgres

docker volume create mongo

docker volume create esdata

docker volume create redis
