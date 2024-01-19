. .\common.ps1
foreach ($i in $stacks) {
    $folderPath = Join-Path $rootPath $i
    if (!(Test-Path $folderPath)) {
        Write-Output "Creating folder for $i"
        New-Item -ItemType Directory -Force -Path $folderPath
    }
    Write-Output "Finding stack $i"
    $isStackRunning = docker stack ls | Out-String -Stream | Select-String -Pattern $i
    if ($isStackRunning) {
        Write-Output "Stack $i is running"
        docker stack rm $i
    } else {
        Write-Output "Stack $i is not running"
        Write-Output "Starting stack $i"
        $stackFile = Join-Path $stackFolder "$i.yml"
        Write-Output "Using stack file $stackFile"
        docker stack deploy -c $stackFile $i
    }
}