Write-Output "Deploy stack"

# Create an array of stacks
$stack = $args[0]

# Perform iteration to remove and deploy them
Write-Output "Removing $i stack"
docker stack rm $stack

Start-Sleep -s 10

# Perform iteration to remove and deploy them
docker stack deploy --compose-file="$($stack)_stack.yml" $stack

Write-Output "List services"
docker service ls