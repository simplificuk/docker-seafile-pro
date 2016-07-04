# docker-seafile-pro
Simplific docker container for seafile pro

Todo: better readme and examples!

This image sets up seafile-pro-server and exposes ports 8000 and 8082.

Useful environment variables:

Ones used by the initial setup script
SEAHUB_ADMIN_EMAIL - The initial user's email, defaults to admin@seahub.com
SEAHUB_ADMIN_PASS - The initial user's password, defaults to pass
SETUP_TYPE - The type of automated setup to run, either blank ("" - default) or "-mysql" for MySQL setup
START_TYPE - How to run seahub, either blank ("" - default) or "-fastcgi" for FastCGI mode

The following are used by seafile's automated setup script, please see their documentation for more details
SERVER_NAME
SERVER_IP
USE_EXISTING_DB
MYSQL_HOST
MYSQL_PORT
MYSQL_ROOT_PASSWORD
MYSQL_USER
MYSQL_USER_PASSWORD
MYSQL_USER_HOST
CCNET_DB
SEAFILE_DB
SEAHUB_DB
SEAFILE_DIR
FILESERVER_PORT - probably not a good idea to change this!
