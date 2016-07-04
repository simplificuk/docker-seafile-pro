#!/bin/sh
echo Starting seahub ${START_TYPE}...
${SEAFILE_HOME}/seafile-server-latest/seahub.sh start${START_TYPE}
echo Tailing seahub STDOUT
tail -f /proc/`cat ${SEAFILE_HOME}/seafile-server-latest/runtime/seahub.pid`/fd/1
echo seahub closed.
