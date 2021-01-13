docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -aq) --force
docker volume rm $(docker volume ls)
docker network prune
