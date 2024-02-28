
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" # Create SQL database with env variable name SQL_DATABASE
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" # Create user SQL_USER with password SQL_PASSWORD
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # Grant full rights to the user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # Modify root rights
mysql -e "FLUSH PRIVILEGES;" # Refresh

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe # Restart MySQL