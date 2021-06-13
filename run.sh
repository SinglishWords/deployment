rm -r singlishwords/src
rm -r singlish-words-frontend

git clone https://github.com/SinglishWords/singlish-words-backend singlishwords/src
git clone https://github.com/SinglishWords/singlish-words-frontend singlish-words-frontend

# Then compile frontend
npm install && npm build

# Then start the whole project
docker-compose up