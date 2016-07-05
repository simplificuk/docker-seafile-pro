#!/bin/sh
echo Starting seahub ${START_TYPE}...
${SEAFILE_INSTALL_DIR}/seahub.sh start${START_TYPE}
echo Tailing seahub STDOUT
tail -f /proc/`cat ${SEAFILE_INSTALL_DIR}/runtime/seahub.pid`/fd/1
echo seahub closed.
