#!/bin/bash
if [ ! -f "${SEAFILE_INSTALL_DIR}/._initialsetup" ]
then
  echo Performing inital setup...
  cd ${SEAFILE_INSTALL_DIR}
  ./setup-seafile${SETUP_TYPE}.sh auto
  ./seafile.sh start
  printf "${SEAHUB_ADMIN_EMAIL}\n${SEAHUB_ADMIN_PASS}\n${SEAHUB_ADMIN_PASS}\n" | ./seahub.sh start${START_TYPE}
  touch "${SEAFILE_INSTALL_DIR}/._initialsetup"
  echo Initial setup complete
fi
