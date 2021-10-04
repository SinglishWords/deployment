FROM mysql:5.7

# Mysql base on Debian, and no user/groups use 1000

RUN groupadd -g 1000 csqsiew &&\
    useradd -u 1000 -g 1000 csqsiew

USER csqsiew:csqsiew

COPY --chown=1000:1000 ./init.sql /docker-entrypoint-initdb.d/