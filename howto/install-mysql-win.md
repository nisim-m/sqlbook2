[標準SQL＋データベース入門 サポートページ](https://nisim-m.github.io/sqlbook2/) 
# 学習用環境（Windows + MySQL）

<!-- TOC -->
1. [MySQLのダウンロード](#mysqlのダウンロード)
2. [MySQLのインストール](#mysqlのインストール)
3. [自動起動の設定](#自動起動の設定)
4. [クライアントツールの起動](#クライアントツールの起動)
   1. [サンプルデータベースの作成](#サンプルデータベースの作成)
<!-- TOC -->

## MySQLのダウンロード

MySQLのダウンロードページ https://www.mysql.com/downloads/ より 
→ [MySQL Community (GPL) Downloads](https://dev.mysql.com/downloads/)
→ MySQL Installer for Windows 
→ バージョンを選択（8.0系と5.7系がある、通常は8.0系を選択）して[Download]をクリック
　mysql-installer-web-community-8.0.xx.0.msi
　 … （サイズが小さい方）インストール中に必要なファイルをDL
　mysql-installer-community-8.0.xx.0.msi
   … （サイズが大きい方）先にDLしてからインストール
→アカウント作成を問われるので、不要な場合は「No thanks, just start my download.」をクリック

<div class="imgtitle">MySQL Community (GPL) Downloads</div>
<a href="images/img1727171439.png"><img src="images/img1727171439.png" width="300"/></a>

<div class="imgtitle">MySQL Installer for Windowsをクリック</div>
<a href="images/imimg1727171529g.png"><img src="images/img1727171529.png" width="300"/></a>

<div class="imgtitle">[Download]をクリック</div>
<a href="images/img1727171604.png"><img src="images/img1727171604.png" width="300"/></a>

<div class="imgtitle">「No thanks, just start my download.」をクリック</div>
<a href="images/img1727172116.png"><img src="images/img1727172116.png" width="300"/></a>

## MySQLのインストール

本書ではMySQLサーバー及び同時にインストールされるコマンドラインクライアント（mysql.exe）のみを使用するため「Server only」を選択しています。

また、途中の設定でポート番号を入力する箇所があります。デフォルトはMariaDBと共通の3306ですが、ここではMariaDBを先にインストールしているため3308に変更しています。番号は任意ですが、何番に設定したかメモしておいてください。

インストールにはいくつかのステップがあり、画面の左側に過程が表示されています。「Execute」をクリックするまで「Back」で適宜遡って変更できます。

完了後に改めてインストーラーを実行することでソフトウェアの追加や設定の変更も可能です。

<div class="imgtitle">（インストーラーが起動するまでしばらく待つ）</div>
<a href="images/img1727173009.png"><img src="images/img1727173009.png" width="300"/></a>

<div class="imgtitle">「Server only」を選択して「Next」をクリック</div>
<a href="images/2024924104040.png"><img src="images/2024924104040.png" width="300"/></a>

<div class="imgtitle">ダウンロードされるファイルが表示されるので「Execute」をクリック</div>
<a href="images/2024924104046.png"><img src="images/2024924104046.png" width="300"/></a>

<div class="imgtitle">「Next」をクリック（必要なファイルが適宜ダウンロードされる）</div>
<a href="images/2024924104123.png"><img src="images/2024924104123.png" width="300"/></a>

<div class="imgtitle">「Execute」をクリック</div>
<a href="images/2024924104128.png"><img src="images/2024924104128.png" width="300"/></a>

<div class="imgtitle">（インストールの経過が表示されるのでしばらく待つ）</div>
<a href="images/2024924104134.png"><img src="images/2024924104134.png" width="300"/></a>

<div class="imgtitle">「Nextをクリック」（次に設定が始まる）</div>
<a href="images/2024924104144.png"><img src="images/2024924104144.png" width="300"/></a>

<div class="imgtitle">「Nextをクリック」</div>
<a href="images/2024924104148.png"><img src="images/2024924104148.png" width="300"/></a>

<div class="imgtitle">必要に応じポート番号を変更して「Next」をクリック（ここでは3308に変更）</div>
<a href="images/2024924104210.png"><img src="images/2024924104210.png" width="300"/></a>

<div class="imgtitle">認証方式の変更（任意、通常は変更不要）を確認し「Next」をクリック</div>
<a href="images/2024924104215.png"><img src="images/2024924104215.png" width="300"/></a>

<div class="imgtitle">MySQLの管理者用パスワードを設定して「Next」をクリック</div>
<a href="images/2024924104236.png"><img src="images/2024924104236.png" width="300"/></a>
※この画面で管理者（root）意外のユーザーも追加可能。本サポートサイトではコマンドで作成する方法を紹介しているのでスキップしています。

<div class="imgtitle">自動起動の設定を確認して「Next」をクリック</div>
<a href="images/2024924104245.png"><img src="images/2024924104245.png" width="300"/></a>
※起動方法は後で変更できます。

<div class="imgtitle">「Next」をクリック</div>
<a href="images/2024924104250.png"><img src="images/2024924104250.png" width="300"/></a>

<div class="imgtitle">「Execute」をクリック</div>
<a href="images/2024924104255.png"><img src="images/2024924104255.png" width="300"/></a>

<div class="imgtitle">（設定が反映されるのでしばらく待つ）</div>
<a href="images/img1727200979.png"><img src="images/img1727200979.png" width="300"/></a>

<div class="imgtitle">「Finish」をクリックする</div>
<a href="images/img1727201016.png"><img src="images/img1727201016.png" width="300"/></a>

<div class="imgtitle">他にインストールしているソフトウェアがある場合は設定を行う（ここではサーバーしか選択していないため続きは特にない）ため「Next」をクリック</div>
<a href="images/2024924104313.png"><img src="images/2024924104313.png" width="300"/></a>

<div class="imgtitle">「Finish」をクリックして完了</div>
<a href="images/2024924104318.png"><img src="images/2024924104318.png" width="300"/></a>


## 自動起動の設定

インストールが完了すると自動でMySQLサーバーが起動します。
起動できているかどうかは「タスクマネージャー」（タスクバーで右クリック→タスクマネージャで起動）の「サービス」で確認できます。

デフォルトではMySQLサーバーはWindows開始時に自動開始されるように設定されています。
学習時のみ手動で開始したい場合は、タスクマネージャから「サービス管理ツール」を開き、MySQLのプロパティで「スタートアップの種類」を手動に変更します。

手動開始の際はタスクマネージャの「サービス」でMySQLを右クリック→「開始」で開始します。

<div class="imgtitle">「サービス」の「MySQL」が「実行中」であるかどうか確認</div>

<div class="imgtitle">タスクバーで右クリック→タスクマネージャ→サービスで実行中の確認、右クリック→サービス管理ツールを開くで設定</div>
<a href="images/2024924104428.png"><img src="images/2024924104428.png" width="300"/></a>

<div class="imgtitle">右クリック→プロパティ</div>
<a href="images/2024924104553.png"><img src="images/2024924104553.png" width="300"/></a>

<div class="imgtitle">スタートアップの種類で自動と手動を切り替える</div>
<a href="images/img1727201504.png"><img src="images/img1727201504.png" width="200"/></a>


## クライアントツールの起動

クライアントのコマンドラインツール（mysql.exe）はスタートメニューから起動できます。

<div class="imgtitle">スタートメニュー→「すべてのアプリ」の「M」にある「MySQL 8.0 Command Line Client - Unicode」で起動</div>
<a href="images/2024924105118.png"><img src="images/2024924105118.png" width="200"/></a>

※「MySQL 8.0 Command Line Client - Unicode」と「MySQL 8.0 Command Line Client」は前提とする文字コードが異なります。通常のSELECT文などを実行する際はどちらでも問題ありませんが、sourceコマンドを使ってサンプルデータのファイルを取り込む場合（この後の解説ページ参照）は「MySQL 8.0 Command Line Client - <strong>Unicode</strong>」の方を使用する必要があります。

<div class="imgtitle">インストール時に入力したパスワードを入力して<kbd>Enter</kbd></div>
<a href="images/2024924105142.png"><img src="images/2024924105142.png" width="300"/></a>

コマンドラインツールではMySQL固有のコマンドとSELECT文などのSQL文を実行できます。コマンドは<kbd>Enter</kbd>で実行、SQL文の場合は`;`が入っていると実行され、入っていない場合は続きの入力をうながすプロンプト（`->`）が表示されます。続きまたは`;`を入力して<kbd>Enter</kbd>を押すとSQL文が実行されます。

### サンプルデータベースの作成

この後の手順はMariaDBと共通です。👉[サンプルデータベースの作成](install-mariadb-win#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E4%BD%9C%E6%88%90)

以下のリンクでサンプルデータをダウンロードしてから「[サンプルデータのインポート](1. [MySQLのダウンロード](#mysqlのダウンロード)
2. [MySQLのインストール](#mysqlのインストール)
3. [自動起動の設定](#自動起動の設定)
4. [クライアントツールの起動](#クライアントツールの起動)
   1. [サンプルデータベースの作成](#サンプルデータベースの作成)
import-mariadb)」の手順でサンプルデータを取り込んでください。
[testdb.sql](https://nisim-m.github.io/sqlbook2/sample/testdb.sql)
[sampledb.sql](https://nisim-m.github.io/sqlbook2/sample/sampledb.sql)
[sampledb2.sql](https://nisim-m.github.io/sqlbook2/sample/sampledb2.sql)

----
[標準SQL＋データベース入門 <small>——RDBとDB設計、基本の力</small> サポートページ](https://nisim-m.github.io/sqlbook2/)
