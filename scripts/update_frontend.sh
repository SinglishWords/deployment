cd ..

# Remove old build
rm -rf ./mnt/html

# Fetch latest changes
rm -rf ./frontend/src
git clone https://github.com/SinglishWords/singlish-words-frontend ./frontend/src

# Copy latest build
cp -r ./frontend/src/build/ ./mnt/html

# Rebuild and recreate frontend container
docker-compose build nginx
docker-compose stop nginx
docker-compose up -d --no-deps nginx

