# Deployment

>  This is guide about how to deploy services in a fresh new server



Clone the deployment repo

```
git clone https://github.com/SinglishWords/deployment
```

Pull the source code repos

```
cd deployment
bash main.sh pull
```

Make sure the system have the tools: docker and docker-compose, if no, install docker by following,

```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

install docker-compose by followings,

```
# https://docs.docker.com/compose/install/

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Make sure the system have a user with id `1000:1000`, if no, create by following command,

```
useradd swosw -u 1000 -g 1000
```

And make sure the owner of the whole deployment folder is `1000:1000`

```
chown -R 1000:1000 *
```

Check if `ip_forward=1` by 

```
sysctl net.ipv4.ip_forward

# And if it's 0, run
sysctl net.ipv4.ip_forward=1
systemctl restart network-manager
# and check again
```



And deploy the front-end pages by,

```
cd frontend/src/
git checkout build
cp -r * ../../mnt/html
cd ~/deployment
```

And copy our server key files into the our key file folder where are `deployment/mnt/config/nginx-conf/conf.d`. 



Then you are free to start our server, run

```
docker-compose up -d
```

Check if every container works fine by,

```
docker ps -a
```

Check if all ports (80/443/8080) are listened correctly by,

```
netstat -anp
```



And stop services by

```
docker-compose down
```

**DANGER**: If you are willing to re-start the server from blank (**I mean empty the data in mysql**), add a `-v` option when you `down` the services.