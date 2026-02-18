FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y apache2 && \
    a2enmod rewrite && \
    a2enmod alias

COPY config/virtualhosts.conf /etc/apache2/sites-available/000-default.conf

RUN mkdir -p /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
