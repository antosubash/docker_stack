# Create an array of stacks
$stacks = @('portainer-agent','mysql','mongo','postgres','elastic', 'redis')

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing $i stack"
    docker stack rm $i
}