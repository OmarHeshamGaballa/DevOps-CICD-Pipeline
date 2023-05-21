FROM  centos:centos8.4.2105
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN  yum install -y httpd
RUN  yum install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
RUN echo "ServerName 127.0.0.1" >> /etc/httpd/conf/httpd.conf
RUN sudo systemctl reload httpd.service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80