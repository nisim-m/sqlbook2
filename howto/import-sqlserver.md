
[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/) 

## データーベースの作成

DROP DATABASE IF EXISTS testdb;
DROP DATABASE IF EXISTS sampledb;
DROP DATABASE IF EXISTS sampledb2;

CREATE DATABASE testdb COLLATE Latin1_General_100_CI_AI_SC_UTF8;
CREATE DATABASE sampledb COLLATE Latin1_General_100_CI_AI_SC_UTF8;
CREATE DATABASE sampledb2 COLLATE Latin1_General_100_CI_AI_SC_UTF8;
go


## サンプルデータの読み込み

