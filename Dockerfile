FROM phusion/baseimage

ENV SEAFILE_VERSION 5.1.7
ENV SEAFILE_EDITION -pro

ENV SEAFILE_HOME /opt/seafile
ENV SEAFILE_DIR ${SEAFILE_HOME}/seafile-data
ENV SEAFILE_INSTALL_DIR ${SEAFILE_HOME}/seafile${SEAFILE_EDITION}-server-${SEAFILE_VERSION}/

ENV USE_EXISTING_DB 0
ENV MYSQL_HOST 127.0.0.1
ENV MYSQL_PORT 3306
ENV CCNET_DB ccnet-db
ENV SEAFILE_DB seafile-db
ENV SEAHUB_DB seahub-db

ENV SEAHUB_ADMIN_EMAIL admin@seahub.com
ENV SEAHUB_ADMIN_PASS pass

ENV SETUP_TYPE ""
ENV START_TYPE ""

RUN apt-get update \
	&& apt-get -y install mysql-client sqlite3 expect openjdk-7-jre poppler-utils python-dev \
	python-pip bash python-setuptools python-imaging python-mysqldb \
	&& pip install --upgrade pip \
	&& pip install boto

ADD seafile${SEAFILE_EDITION}-server_${SEAFILE_VERSION}_x86-64.tar.gz ${SEAFILE_HOME}

RUN mkdir /etc/service/seahub \
	&& mkdir /etc/service/seafile

COPY seahub.sh /etc/service/seahub/run
COPY seafile.sh /etc/service/seafile/run
RUN mkdir -p /etc/my_init.d
COPY initialsetup.sh /etc/my_init.d/initialsetup.sh

WORKDIR ${SEAFILE_HOME}
VOLUME ${SEAFILE_HOME}

EXPOSE 8000
EXPOSE 8082

CMD ["/sbin/my_init"]
