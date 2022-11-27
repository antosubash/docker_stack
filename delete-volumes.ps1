Write-Output "Delete volumes"
. .\common.ps1
# Perform iteration to remove and deploy them
foreach ($i in $stacks) {
    Write-Output "Removing volume $i"
    docker volume rm $i
}