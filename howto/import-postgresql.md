
[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/) 

## データーベースの作成

DROP DATABASE IF EXISTS testdb;
DROP DATABASE IF EXISTS sampledb;
DROP DATABASE IF EXISTS sampledb2;

CREATE DATABASE testdb
    WITH ENCODING 'UTF8'
    LC_COLLATE='und-x-icu'
    LC_CTYPE='und-x-icu'
    TEMPLATE template0;

CREATE DATABASE sampledb
    WITH ENCODING 'UTF8'
    LC_COLLATE='und-x-icu'
    LC_CTYPE='und-x-icu'
    TEMPLATE template0;

CREATE DATABASE sampledb2
    WITH ENCODING 'UTF8'
    LC_COLLATE='und-x-icu'
    LC_CTYPE='und-x-icu'
    TEMPLATE template0;



$ initdb --encoding=UTF-8 --locale=ja_JP.UTF-8
DROP DATABASE IF EXISTS testdb;
DROP DATABASE IF EXISTS sampledb;
DROP DATABASE IF EXISTS sampledb2;

CREATE DATABASE testdb;
CREATE DATABASE sampledb;
CREATE DATABASE sampledb2;

（未検証）
cd C:\Program Files\PostgreSQL\16
bin\initdb -D data --encoding=UTF-8 --locale=ja_JP.UTF-8
initdb: ロケール"ja_JP.UTF-8"用の適切なテキスト検索設定が見つかりませんでした

## サンプルデータの読み込み

