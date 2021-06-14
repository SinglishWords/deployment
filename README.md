# Deployments

## Require

1. Docker
2. Docker-compose (already built in windows version docker-desktop.)
3. Git (git is used to pull the project source, so be sure about the ssh access of github.)

## Usage

First, clone the source files from github.

```bash
git clone https://github.com/SinglishWords/singlish-words-backend backend/src
git clone https://github.com/SinglishWords/singlish-words-frontend frontend/src
```

Then start the whole project.

Note that the backend part will be built in a container (when call the command below)

Update: now the frontend part will also be built inside a container.

```bash
docker-compose up
```

## Some important notes

We are using docker! 

And I have mounted a lot of data/log/static files to the local file system, which means, the mysql database files, frontend static pages, logs ... are stored in local file system (so we don't need to access the containers file system to read them).

And for different platforms, you may need to change the mount directory as you want (and as the operating system want)

These projection rules are defined in `docker-compose.yml` file, you should look at `volumns` options.

For example,

```yaml
...
        volumes:
            - ./mnt/log/singlishwords:/var/log/singlishwords
...
```

This setting means, we attach the folder `/var/log/singlishwords` inside a container, with the folder `./mnt/log/singlishwords` on your PC. Now these two folders are the same thing (like two references).

> Currently I mount everything under the `./mount/`, I will change them to some folder that looks more standard linux way (like move all log files to `/var/log/` folder).


## To do stress test and check status

### Use apache benchmark 

```bash
# questions are cache in redis
ab -l -n 20000 -c 2000 http://localhost:8080/api/v1/questions
# answers are not, so it will put stress to mysql
# user won't read answers a lot, so won't be a problem.
ab -l -n 20000 -c 2000 http://localhost:8080/api/v1/answers
```

### Check memory/cpu usage

```bash
sudo docker stats
```

### Login into mysql and check

```bash
# Use this command to log into the container
# Replace deployment_mysql_1 to the actual container name
# Use container ls -a
sudo docker exec -it deployment_mysql_1 /bin/bash

# Then login mysql using root user and password
# Replace the password as -p{your_password}
mysql -uroot -pd8sx9anc8asx
```

To check mysql database status like this

```sql
show variables like '%max_connections%';
show global status like 'Max_used_connections';
```

