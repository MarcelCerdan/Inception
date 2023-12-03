
service mysql start;

mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" # Create SQL database with env variable name SQL_DATABASE
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" # Create user SQL_USER with password SQL_PASSWORD
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # Grant full rights to the user
mysql -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # Modify root rights
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" # Refresh

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe # Restart MySQL