FROM ubuntu 
RUN apt update; \
DEBIAN_FRONTEND=noninteractive apt install apache2 -y
#RUN DEBIAN_FRONTEND=noninteractive apt install apache2-utils –y
RUN apt clean 
RUN mkdir -p /var/www/domain.com/public_html
COPY  index.php /var/www/domain.com/public_html
COPY domain.com.conf /etc/apache2/sites-available/domain.com.conf
RUN a2dissite 000-default.conf
RUN a2ensite domain.com.conf
EXPOSE 80
CMD apachectl -D FOREGROUND