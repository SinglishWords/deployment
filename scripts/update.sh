docker-compose up -d

sh data-export.sh

docker-compose down -v

sh ./clean.sh

cd ..

bash ./main.sh pull

chown -R 1000:1000 *

sysctl net.ipv4.ip_forward

cp -r ./frontend/src/build ./mnt/html

docker-compose up -d

docker exec -u 0 deployment_jupyter_1 rm -rf /home/jovyan/work && mkdir /home/jovyan/work

docker cp ./management/src/. deployment_jupyter_1:/home/jovyan/work/.

docker cp ./cues/src/cues.csv deployment_jupyter_1:/home/jovyan/work/export-data/cues.csv

cd ./scripts

sh ./data-refresh.sh