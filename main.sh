function help() {
    cat << EOF
Usage: ./main.sh
    pull ['backend'|'frontend'|default='all']: 
        pull or clone the backend/frontend repo from github
    deploy:
        (re)deploy the containers (note, will not delete volumes etc, just start the app)
    down:
        stop the containers
    rebuild <name>:
        rebuild the image
    rebuild-frontend-local:
        rebuild the frontend in local (not in container)
    volume:
        show:
            show the volumes we are using;
        delete ['frontend'|'mysql']:
            delete the volume;
    stats:
        call "docker stats"
    help:
        show this help
EOF
}


frontend_repo='https://www.github.com/SinglishWords/singlish-words-frontend.git'
backend_repo='https://www.github.com/SinglishWords/singlish-words-backend.git'
jupyter_repo='https://github.com/SinglishWords/management.git'

frontend_src='./frontend/src'
backend_src='./backend/src'
jupyter_src='./jupyter/src'


frontend_volume='deployment_frontend-static'
mysql_volume='deployment_singlishwords-mysql'

base_path="http://localhost:8081"
report_dir="./reports"


function _pull_or_clone() {
    # two params, [ src folder, repo link  ]
    if test -d "$1"
    then
        cd $1
        git pull
    else 
        git clone $2 $1
    fi
}

function pull() {
    if test $1 = "backend"
    then
        _pull_or_clone $backend_src  $backend_repo
    elif test $1 == "frontend"
    then 
        _pull_or_clone $frontend_src $frontend_repo
    elif test $1 == "jupyter"
    then
        _pull_or_clone $jupyter_src  $jupyter_repo
    else
        _pull_or_clone $frontend_src $frontend_repo
        _pull_or_clone $backend_src  $backend_repo
        _pull_or_clone $jupyter_src  $jupyter_repo
    fi
}


function volume() {
    if test "$1" = "delete"
    then
        if test "$2" = "frontend"
        then
            docker volume rm $frontend_volume
        elif test "$2" = "mysql"
        then
            docker volume rm $mysql_volume
        fi
    else
        docker volume ls | grep deployment | awk '{print $2}'
    fi
}

function stats() {
    docker stats
}

function deploy() {
    docker-compose up -d
}

function down() {
    docker-compose down
}

function rebuild() {
    docker-compose build $1
}

function rebuild_frontend_on_local() {
    cd $frontend_src
    npm run build
    cp -r build/* /var/lib/docker/volumes/deployment_frontend-static/_data/
}

if test "$1" = "pull"
then
    pull $2
elif test "$1" = "deploy"
then
    deploy 
elif test "$1" = "rebuild"
then
    rebuild $2
elif test "$1" = "volume"
then
    volume $2 $3
elif test "$1" = "stats"
then
    stats
elif test "$1" = "rebuild-frontend-local"
then
    rebuild_frontend_on_local
else
    help
fi
