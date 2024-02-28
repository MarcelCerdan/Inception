FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/install.sh /var/install.sh

CMD ["bash", "/var/install.sh"]

EXPOSE 3306