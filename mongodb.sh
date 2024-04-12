#!/bin/bash
mkdir monguitodata && cd monguitodata; mkdir log; cd ..
sudo docker-compose up -d
echo "Monguito está iniciandose ......."
sudo docker exec -it monguito bash
