Write-Output "Swarm Init"
docker swarm init

Write-Output "Creating volumes"
$stacks = @('portainer','mysql','mongo','postgres-data','esdata', 'redis')

foreach ($i in $stacks) {
    Write-Output "Creating volume $i"
    docker volume create $i
}