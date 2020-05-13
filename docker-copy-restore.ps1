$dockerContainerId = docker ps --filter "ancestor=mdillon/postgis:latest" --format "{{.ID}}"

Write-Output $dockerContainerId

docker cp "C:\backup\$($args[0]).dump" "$($dockerContainerId):/home"
docker exec -t $dockerContainerId pg_restore --no-privileges --no-owner -d $($args[0]) /home/$($args[0]).dump -c -U postgres

Write-Output $dockerContainerId
Write-Output "Done!"
