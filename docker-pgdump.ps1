$dockerContainerId = docker ps --filter "name=postgres_db" --format "{{.ID}}"

Write-Output $dockerContainerId

$FileName = "C:\backup\test.sql"
if (Test-Path $FileName) 
{
  Remove-Item $FileName
}


docker exec -t $dockerContainerId pg_dumpall -h localhost -U postgres > $FileName