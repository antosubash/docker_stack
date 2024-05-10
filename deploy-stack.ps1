Write-Output "Deploy stack"

# Create an array of stacks
. .\common.ps1

$currentPath = $(pwd)

# List all the stacks

Write-Output "Displaying all stacks"
$stacks

# Change the directory to the stack folder
Set-Location $stackFolder

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing $i stack"
    docker stack rm $i
}

Start-Sleep -s 5

# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Deploy $i stack"
    docker stack deploy --compose-file="$($i).yml" $i
}


Write-Output "List services"
docker service ls

# Change the directory back to the root folder
Set-Location $currentPath


