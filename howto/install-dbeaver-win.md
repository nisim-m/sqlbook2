[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/) 

<!-- TOC -->
1. [DBeaverのダウンロード](#dbeaverのダウンロード)
2. [DBeaverのインストール](#dbeaverのインストール)
3. [起動と各DBMSの設定](#起動と各dbmsの設定)
   1. [MariaDBへの接続](#mariadbへの接続)
   2. [MySQLへの接続](#mysqlへの接続)
   3. [PostgreSQLへの接続](#postgresqlへの接続)
   4. [SQL Serverへの接続](#sqlserverへの接続)
<!-- TOC -->

## DBeaverのダウンロード

DBeaverのダウンロードページ [https://dbeaver.io/download/](https://dbeaver.io/download/) でインストーラーをダウンロードします。

![Windows (iInstaller)をクリックしてダウンロード](images/24928223229.png)

## DBeaverのインストール

ダウンロードしたファイル（ここでは`dbeaver-ce-24.1.0-x86_64-setup.exe`）を実行します。

<div class="imgtitle">インストール時の言語を選択</div>
<a href="images/24928223240.png"><img src="images/24928223240.png" width="300"/></a>
<div class="imgtitle">「次へ」をクリック</div>
<a href="images/24928223243.png"><img src="images/24928223243.png" width="300"/></a>
<div class="imgtitle">「同意する」をクリック</div>
<a href="images/24928223249.png"><img src="images/24928223249.png" width="300"/></a>
<div class="imgtitle">全ユーザーで使用するか自分だけ使用するかを選択して「次へ」をクリック</div>
<a href="images/24928223253.png"><img src="images/24928223253.png" width="300"/></a>
<div class="imgtitle">「次へ」をクリック</div>
<a href="images/24928223257.png"><img src="images/24928223257.png" width="300"/></a>
<div class="imgtitle">「次へ」をクリック</div>
<a href="images/img1727567410.png"><img src="images/img1727567410.png" width="300"/></a>
<div class="imgtitle">「インストール」をクリック</div>
<a href="<images/img1727567452.png>"><img src="<images/img1727567452.png>" width="300"/></a>
<div class="imgtitle">「完了」をクリック</div>
<a href="images/24928223321.png"><img src="images/24928223321.png" width="300"/></a>

## 起動と各DBMSの設定

スタートメニューの「D」-「DBeaver Community」にある「DBeaver」で起動します。頻繁に使う場合は「スタートにピン留め」をしておくと良いでしょう。

<div class="imgtitle">DBeaverを起動</div>
<a href="images/24928223419.png"><img src="images/24928223419.png" width="300"/></a>

設定および使用方法はLinux/Windows共通です。概要は[学習用環境（Windows + VMware + Ubuntu）のページ](install-vmware#dbeaverの設定)を参照してください。

接続先の追加は「新しい接続」ボタン（Ctrl+Shift+N）で行います。
<div class="imgtitle">新しい接続で接続先を追加</div>
<a href="images/24928235919.png"><img src="images/24928235919.png" width="300"/></a>

以下は、各DBMSへの接続についてポイントのみ示します。

### MariaDBへの接続

<div class="imgtitle">接続タイプでMariaDBを選択</div>
<a href="images/img1727568093.png"><img src="images/img1727568093.png" width="300"/></a>
<div class="imgtitle">ポート番号を確認しパスワードを入力する</div>
<a href="images/24928223536.png"><img src="images/24928223536.png" width="300"/></a>
<div class="imgtitle">データベース→テーブルでテーブルの定義を確認</div>
<a href="images/24928223621.png"><img src="images/24928223621.png" width="300"/></a>

### MySQLへの接続

<div class="imgtitle">接続タイプでMariaDBを選択</div>
<a href="images/img1727568481.png"><img src="images/img1727568481.png" width="300"/></a>
<div class="imgtitle">ポート番号を確認しパスワードを入力する</div>
<a href="images/24928223719.png"><img src="images/24928223719.png" width="300"/></a>
<div class="imgtitle">データベース→テーブルでテーブルの定義を確認</div>
<a href="images/24928223746.png"><img src="images/24928223746.png" width="300"/></a>

### PostgreSQLへの接続

<div class="imgtitle">接続タイプでPostgreSQLを選択</div>
<a href="images/24928223814.png"><img src="images/24928223814.png" width="300"/></a>
<div class="imgtitle">ポート番号を確認しパスワードを入力する</div>
<a href="images/24928223829.png"><img src="images/24928223829.png" width="300"/></a>
<div class="imgtitle">データベース→スキーマ→public→テーブルでテーブルの定義を確認</div>
<a href="images/24928223913.png"><img src="images/24928223913.png" width="300"/></a>

### SQL&nbsp;Serverへの接続

DBeaverからSQL&nbsp;Serverに接続するには、SQL&nbsp;Serverの設定でTCP/IPを有効にして、ポート番号を設定する必要があります。
設定はSQL&nbsp;Server&nbsp;2022 構成マネージャーで行います。

なお、GUIベースでの接続はSQL&nbsp;Server用の管理ツールであるSSMS（👉[SQL Server Management Studio （SSMS: 管理ツール）](install-sqlserver-win#SSMS)）から行うことが可能です。

#### SQL&nbsp;Serverの設定

<div class="imgtitle">スタートメニューから「SQL&nbsp;Server&nbsp;2022」にある「SQL&nbsp;Server&nbsp;2022 構成マネージャー」を起動</div>
<a href="images/img1727568990.png"><img src="images/img1727568990.png" width="300"/></a>
<div class="imgtitle">「SQL&nbsp;Serverネットワークの構成」→「SQLEXPRESSのプトロコル」で「TCP/IP」を右クリックして有効にする</div>
<a href="images/img1727568713.png"><img src="images/img1727568713.png" width="300"/></a>
<div class="imgtitle">設定変更の警告メッセージが表示されたら「OK」をクリック</div>
<a href="images/img1727568732.png"><img src="images/img1727568732.png" width="300"/></a>
<div class="imgtitle">同じく「TCP/IP」を右クリックしてプロパティを開く</div>
<a href="images/24928225227.png"><img src="images/24928225227.png" width="300"/></a>
<div class="imgtitle">一番下にある「IPAll」のTCPポートを設定する（ここではSQL&nbsp;Serverの初期値である1433を使用）</div>
<a href="images/2492823629.png"><img src="images/2492823629.png" width="300"/></a>
<div class="imgtitle">タスクバーで右クリック→タスクマネージャ→サービスでSQL&nbsp;Serverを再起動する</div>
<a href="images/2492823653.png"><img src="images/2492823653.png" width="300"/></a>

指定したポート番号で接続を待機しているかどうかは、`netstat -an | findstr ポート番号`で確認できます。なにも表示されない場合、「TCP/IP」のプロパティで<strong>「IPAll」</strong>の設定を確認し、サービスでSQL&nbsp;Serverを再起動してみてください。

#### DBeaverの設定

<div class="imgtitle">接続タイプでSQL&nbsp;Serverを選択</div>
<a href="images/24928223925.png"><img src="images/24928223925.png" width="300"/></a>
<div class="imgtitle">ポート番号を確認し認証を「Windows Authentication」にする</div>
<a href="images/2492903630.png"><img src="images/2492903630.png" width="300"/></a>
<div class="imgtitle">データベース→Schemas→dbo→Tablesでテーブルの定義を確認</div>
<a href="images/2492903831.png"><img src="images/2492903831.png" width="300"/></a>

----
[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/)

