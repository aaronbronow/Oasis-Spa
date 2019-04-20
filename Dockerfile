FROM raspbian/stretch

ENV DEBIAN_FRONTEND "noninteractive"
ENV APP_PASS "raspberry"
ENV ROOT_PASS "oasis"
ENV APP_DB_PASS "raspberry"

RUN echo "debconf debconf/frontend select $DEBIAN_FRONTEND" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASS" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ROOT_PASS" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/mysql/app-pass password $APP_DB_PASS" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections

RUN apt-get -yq update
RUN apt-get -yq install apache2 mysql-server phpmyadmin
RUN apt-get -yq install curl vim git-core

RUN chown :www-data /var/www/html
WORKDIR /var/www/html

VOLUME /var/lib/mysql
COPY docker/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
# EXPOSE 80 8000
# EXPOSE 3306 33060

COPY . .
RUN chown -R :www-data .
RUN chmod -R 755 .