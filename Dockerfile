FROM  ubuntu:latest
RUN apt-get update -y && apt-get install -y apache2
RUN apt-get install -y unzip
RUN  mkdir -p /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
RUN echo "ServerName example.com" >> /etc/apache2/apache2.conf
RUN service apache2 restart
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80 