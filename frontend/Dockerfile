# FROM node:14 as builder

# COPY ./src /singlishwords-react/src/

# WORKDIR /singlishwords-react/src/

# RUN npm install -g npm@latest && \
#     npm install && \
#     npm run build && \
#     cp -r /singlishwords-react/src/build/ /data/

FROM nginx:1.21-alpine as prod

# COPY --from=builder /singlishwords-react/src/build/ /usr/share/nginx/html/