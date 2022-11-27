$rootPath = "C:\docker\data"
$stackFolder = Join-Path $(pwd) "stacks"
$stacks = @('portainer', 'mongo', 'postgres', 'redis', 'geoserver', 'keycloak', 'nuget', 'rabbitmq', 'seq', 'minio')
