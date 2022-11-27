Write-Output "Deploy stack"

# Create an array of stacks
..\common.ps1

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing $i stack"
    docker stack rm $i
}

Start-Sleep -s 5

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Deploy $i stack"
    docker stack deploy --compose-file="$($i)_stack.yml" $i
}


Write-Output "List services"
docker service ls


