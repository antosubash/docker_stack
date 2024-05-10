$rootPath = "C:\docker\data"
$stackFolder = Join-Path $(pwd) "stacks"
$stacks = @('postgres', 'redis', 'minio', 'ollama', 'qdrant')
