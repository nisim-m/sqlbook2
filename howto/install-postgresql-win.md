
## ダウンロード

https://www.postgresql.jp/download

ダウンロードリンクでWindowsのリンクをクリック
![](images/img1715015596.png)

Download the installer 
![](images/img1715015675.png)

Windows x86-64のダウンロードアイコンをクリック（ダウンロードが自動で始まる）
![](images/img1715015779.png)

## インストール

ダウンロードしたインストーラーを実行（ここでは`postgresql-16.2-1-windows-x64.exe`）

Nextをクリック
![](images/img1715016008.png)

Nextをクリック
![](images/img1715016062.png)

Nextをクリック
![](images/img1715016096.png)

Nextをクリック
![](images/img1715016157.png)

パスワードを入力してNextをクリック
![](images/img1715016265.png)

Nextをクリック（※ポート番号 5432）
![](images/img1715016334.png)

Nextをクリック ※Default localeで良いか要確認
![](images/img1715016396.png)

Nextをクリック（設定内容が表示されている）
![](images/img1715016441.png)

Nextをクリック
![](images/img1715016517.png)

（インストール中）
![](images/img1715016787.png)

Stack Builderのチェックマークを外してFinishをクリック![](images/img1715017260.png)

※Stack Builderチェックマークを入れたままの場合スタックビルダが起動するのでキャンセルで終了、スタックビルダはODBCドライバなどを追加する際に使用、スタートメニューで「すべてのアプリ」から「PostgreSQL」フォルダの「Application Stack Builder」でいつでも使用できる
![](images/img1715017290.png)


起動と終了、自動実行
タスクマネージャーおよびサービスのpostgresql-x64-バージョン
⇒参考：MariaDB

## コマンドライン
スタートメニューでSQL Shellを検索して実行
![](images/img1715017718.png)
