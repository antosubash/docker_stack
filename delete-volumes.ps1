Write-Output "Delete volumes"


$stacks = @('portainer','mysql','mongo','postgres-data','esdata', 'redis')

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing volume $i"
    docker volume rm $i
}