FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata 
ENV TZ "Asia/Shanghai" 
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata && apt-get install -y git curl apache2 php libapache2-mod-php php-mysql php-xml php-zip php-gd php-mbstring php-iconv && rm -f /etc/localtime && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN rm -rf /var/www/html/* && rm -f /etc/apache2/sites-available/000-default.conf 
ADD ./settings/000-default.conf /etc/apache2/sites-available/
# ADD src /var/www/html/
COPY run.sh /run.sh 
RUN a2enmod rewrite && chown -Rf www-data:www-data /var/www/html/ && chmod a+rx /run.sh
RUN rm -rf /var/lib/apt/lists/*  apt-get autoclean &&  apt-get clean
ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_LOCK_DIR /var/lock/apache2 
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80 
CMD ["/bin/bash", "/run.sh"]