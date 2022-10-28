cd ..

# Fetch latest changes
rm -rf ./backend/src
git clone https://github.com/SinglishWords/singlish-words-backend ./backend/src

# Rebuild and recreate frontend container
docker-compose build singlishwords_app
docker-compose stop singlishwords_app
docker-compose up -d --no-deps singlishwords_app
