docker-compose up -d

sh data-export.sh

docker-compose down -v

cd ..

git fetch
git reset --hard HEAD
git merge '@{u}'

rm -rf ./frontend/src
rm -rf ./backend/src
rm -rf ./management/src
rm -rf ./mnt/html

git clone https://github.com/SinglishWords/singlish-words-frontend-v2 ./frontend/src
git clone https://github.com/SinglishWords/singlish-words-backend ./backend/src
git clone https://github.com/SinglishWords/management ./management/src

useradd swosw -u 1000 -g 1000

chown -R 1000:1000 *

sysctl net.ipv4.ip_forward

cp -r ./frontend/src/build/ ./mnt/html

docker-compose build

docker-compose up -d

cd ./scripts

sh ./csv-update.sh

sh ./data-refresh.sh