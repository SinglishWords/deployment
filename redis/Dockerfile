FROM redis:alpine

# 1. Consider use -D options
#   -G GRP		Group
#	-S		Create a system user
#   -D		Don't assign a password
# 
# 2. Note that, the `redis` user group is 1000, so we use the -G redis
RUN adduser -u 1000 -S csqsiew -G redis

USER csqsiew