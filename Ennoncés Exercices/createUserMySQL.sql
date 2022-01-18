CREATE USER 'mysql_user'@'localhost' IDENTIFIED BY 'azerty1234';
FLUSH PRIVILEGES;
GRANT SELECT ON my_sql.* TO mysql_user@'localhost' IDENTIFIED BY 'azerty1234';
FLUSH PRIVILEGES;