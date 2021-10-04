# FROM node:14 as builder

# COPY ./src /singlishwords-react/src/

# WORKDIR /singlishwords-react/src/

# RUN npm install -g npm@latest && \
#     npm install && \
#     npm run build && \
#     cp -r /singlishwords-react/src/build/ /data/

# FROM nginx:1.21-alpine as prod

FROM nginx:1.21-alpine

RUN addgroup -g 1000 -S csqsiew && \
    adduser -u 1000 -S csqsiew -G csqsiew && \
    chown csqsiew:csqsiew -R /var/log/nginx
    
USER csqsiew

RUN mkdir /tmp/nginx/

# FROM nginxinc/nginx-unprivileged:1.21.3-perl

# USER nginx


# COPY --from=builder /singlishwords-react/src/build/ /usr/share/nginx/html/