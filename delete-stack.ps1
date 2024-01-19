. .\common.ps1
# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing $i stack"
    docker stack rm $i
}