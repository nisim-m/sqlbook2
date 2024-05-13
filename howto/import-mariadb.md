
## データーベースの作成

DROP DATABASE IF EXISTS testdb;
DROP DATABASE IF EXISTS sampledb;
DROP DATABASE IF EXISTS sampledb2;

CREATE DATABASE testdb;
CREATE DATABASE sampledb;
CREATE DATABASE sampledb2;

my.iniに`character-set-server=utf8mb4`の指定がない場合

CREATE DATABASE mydatabase
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;



## サンプルデータの読み込み

