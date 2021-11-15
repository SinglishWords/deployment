docker-compose up -d

sh data-export.sh

docker-compose down -v

sh ./clean.sh

bash ../main.sh pull

cp -r ./frontend/src/build ./mnt/html

docker-compose up -d

docker cp -r ../management/src deployment_jupyter_1:/home/jovyan/work

docker cp ../cues/src/cues.csv deployment_jupyter_1:/home/jovyan/work/export-data/cues.csv

sh ./data-refresh.sh