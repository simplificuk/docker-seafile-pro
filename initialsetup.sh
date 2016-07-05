#!/bin/bash
if [ ! -f "${SEAFILE_INSTALL_DIR}/._initialsetup" ]
then
  echo Performing inital setup...
  cd ${SEAFILE_INSTALL_DIR}
  ./setup-seafile.sh auto
  ./setup-seafile${SETUP_TYPE}.sh auto -n "${SERVER_NAME:-`hostname -s`}" \
	-i "${SERVER_IP:-`hostname -i`}" \
	-p "${FILESERVER_PORT:-8082}" \
	-d "${SEAFILE_DIR:-.}" \
	-e "${USE_EXISTING_DB:-0}" \
	-o "${MYSQL_HOST:-localhost}" \
	-t "${MYSQL_PORT:-3306}" \
	-r "${MYSQL_ROOT_PASSWD}" \
	-u "${MYSQL_USER}" \
	-w "${MYSQL_USER_PASSWD}" \
	-q "${MYSQL_USER_HOST:-%}" \
	-c "${CCNET_DB:-ccnet-db}" \
	-s "${SEAFILE_DB:-seafile-db}" \
	-b "${SEAHUB_DB:-seahub-db}"
  ./seafile.sh start
  printf "${SEAHUB_ADMIN_EMAIL}\n${SEAHUB_ADMIN_PASS}\n${SEAHUB_ADMIN_PASS}\n" | ./seahub.sh start
  kill `cat ${SEAFILE_INSTALL_DIR}/runtime/seahub.pid`
  touch "${SEAFILE_INSTALL_DIR}/._initialsetup"
  echo Initial setup complete
fi
