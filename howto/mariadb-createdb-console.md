[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/) 

<div class="codetitle">（参考）実行画面サンプル</div>
~~~console
$ mariadb -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 46
Server version: 10.11.8-MariaDB-0ubuntu0.24.04.1 Ubuntu 24.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE testdb default character set utf8mb4;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> CREATE DATABASE sampledb default character set utf8mb4;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> CREATE DATABASE sampledb2 default character set utf8mb4;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sampledb           |
| sampledb2          |
| sys                |
| testdb             |
+--------------------+
7 rows in set (0.001 sec)

MariaDB [(none)]> CREATE USER 'study'@'localhost' IDENTIFIED BY 'test';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> GRANT ALL ON testdb.* TO 'study'@'localhost' WITH GRANT OPTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> GRANT ALL ON sampledb.* TO 'study'@'localhost' WITH GRANT OPTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> GRANT ALL ON sampledb2.* TO 'study'@'localhost' WITH GRANT OPTION;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> quit
Bye
$ 
~~~

----
[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/)

