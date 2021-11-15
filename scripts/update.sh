docker-compose up -d

sh data-export.sh

docker-compose down -v

sh ./clean.sh

cd ..

bash ./main.sh pull

cd ./scripts

cp -r ../frontend/src/build ../mnt/html

docker-compose up -d

docker docker exec -u 0 deployment_jupyter_1 rm -rf /home/jovyan/work/.

docker cp ../management/src/. deployment_jupyter_1:/home/jovyan/work/.

docker cp ../cues/src/cues.csv deployment_jupyter_1:/home/jovyan/work/export-data/cues.csv

sh ./data-refresh.sh