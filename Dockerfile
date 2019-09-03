FROM adminer:4.7.3

USER root
RUN apk add --no-cache --virtual .php-ext-deps unixodbc freetds && \
    apk add --no-cache --virtual .build-deps unixodbc-dev freetds-dev && \
    docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr && \
    docker-php-ext-install pdo_odbc pdo_dblib && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

USER adminer
CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]
EXPOSE 8080

