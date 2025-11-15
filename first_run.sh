if [ -d "tsserver.sqlitedb" ]; then
    echo "Delete tsserver.sqlitedb dir!!!"
    exit
fi
if [ -f "tsserver.sqlitedb" ]; then
    echo "File tsserver.sqlitedb already exist. Delete it and run script again."
    exit
fi
docker compose down
docker rm $(docker stop tsserver) || echo Starting...
docker run -d --name tsserver evgeniyfimushkin/tsserver:0.99
docker logs tsserver &> logs
docker cp tsserver:/teamspeak-server_linux_amd64/tsserver.sqlitedb ./
docker rm $(docker stop tsserver)
docker compose up -d
sleep 5
docker logs tsserver
