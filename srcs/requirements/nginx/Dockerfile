FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mthibaul.42.fr/UID=mthibaul"
#-x509 certificate type, -nodes to skip the password

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 443