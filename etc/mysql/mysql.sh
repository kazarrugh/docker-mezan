#!/bin/bash
set -e
set -x
mysql -h mysqldb -u root -p7*gMH2sfh@Bv -e "CREATE DATABASE testdb"
#mysqldump mezan_defaultdb -h mezan.ly -u makemezan -pXBzoYVRViF6Xu9xL > ./defaultdb.sql
#/usr/bin/mysqld_safe --skip-grant-tables &
#sleep 5
#mysql -u root -p7*gMH2sfh@Bv -e "CREATE DATABASE mydb"
#mysql -u root -p7*gMH2sfh@Bv -e "CREATE DATABASE testdb"
#mysqldump mezan_defaultdb -h mezan.ly -u makemezan -pXBzoYVRViF6Xu9xL > defaultdb.sql
#mysql -u systemuser -pVB5mgDNh91Bw mezan_defaultdb< defaultdb.sql
#mysql -u root -p7*gMH2sfh@Bv -e "CREATE DATABASE mezan_defaultdb"
#mysqldump mezan_defaultdb -h mezan.ly -u makemezan -pXBzoYVRViF6Xu9xL | mysql -u systemuser -pVB5mgDNh91Bw mezan_defaultdb