FROM base:alpine-3.8

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
	git \
	libressl2.7-libssl \
	logrotate \
	openssl \
	php7 \
	php7-fileinfo \
	php7-fpm \
	php7-json \
	php7-mbstring \
	php7-openssl \
	php7-session \
	php7-simplexml \
	php7-xml \
	php7-xmlwriter \
	php7-zlib && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9000
VOLUME /config
