FROM nginx

LABEL name="nginx" version="1.0.0"

COPY ./nginx.conf /etc/nginx/nginx.conf
