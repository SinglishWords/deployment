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

git clone https://github.com/SinglishWords/singlish-words-frontend ./frontend/src
git clone https://github.com/SinglishWords/singlish-words-backend ./backend/src
git clone https://github.com/SinglishWords/management ./management/src

find ./ -type f | xargs perl -pi -e "s/singlishwords[s.]nus.edu.sg(?!.chained)/localhost:443/g"

cp -r ./frontend/src/build/ ./mnt/html

docker-compose build

docker-compose up -d

cd ./scripts

sh ./csv-update.sh

sh ./data-refresh.sh