# 標準SQL＋データベース入門
——RDBとDB設計、基本の力

[技術評論社](https://gihyo.jp/book/2024/978-4-297-14469-2)  
[Amazon](https://www.amazon.co.jp/dp/4297144697)  
2024.9

<!-- TOC -->

- [テスト環境](#%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83)
- [サンプルデータ](#%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF)
    - [本書で使用するサンプルデータベース](#%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9)
    - [本書で使用するサンプルデータ](#%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF)
- [正誤表](#%E6%AD%A3%E8%AA%A4%E8%A1%A8)
- [履歴](#%E5%B1%A5%E6%AD%B4)

<!-- /TOC -->

## テスト環境
<a id="markdown-%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83" name="%E3%83%86%E3%82%B9%E3%83%88%E7%92%B0%E5%A2%83"></a>

本書に掲載しているSQL文を実行するためのテスト環境を導入する方法です。以下の3種類を紹介しています。ご自身が利用している環境とお好みに応じて選択してください。
- [VMware + Ubuntu](howto/install-vmware)
仮想環境にUbuntuをインストールし、DBMSをインストールする （MariaDB/PostgreSQL）  <br/> <br/> 
テスト環境や勉強用の環境を作りたいときには、VMwareやVirtualBoxのような「仮想化環境」が便利です。  
仮想化環境を利用することで、普段使っているOSはそのままで、別途OSを動かし、そこでデータベースを動かすことができます。環境の作り直しも簡単で、テスト環境が不要になったら仮想環境ごと削除することもできます。Unix系OSでの導入を考えている場合、本番環境に近い環境で試すことができるというメリットがあります。 <br/> 
導入するUbuntuはデスクトップ版で、GUIからDBMSに接続する方法の1つとしてDBeaverを紹介しています。なお、本書のサンプル実行にあたっては、GUIを使用せず、コマンドラインのみの利用でも問題ありません。  <br/> 
VirtualBoxを利用する予定の方は、「基本がわかるSQL入門」のサポートページ（[VirtualBox + Ubuntu](https://nisim-m.github.io/sqlbook/howto/install-ubuntu.html)を参考にしてください。バージョンは異なりますが基本的な方法は共通です。こちらではApacheとPHPをインストールして、WebブラウザでSQL文を入力して試す方法も紹介しています。
  
- [Windows環境へのインストール](howto/install-windows) 
Windows版のDBMSをインストールする（MySQL/MariaDB/PostgreSQL/Microsoft SQL Server）  
それぞれのコマンドラインクライアントでSQLを実行する方法（参考、コマンド操作に慣れている人向け）および、GUI環境として、DBeaverの導入方法を解説しています。

- [Web環境の利用](howto/sqlfiddle) 
SQL&nbsp;Fiddleというオンラインサービスでサンプルデータを使う方法を紹介しています。

<a id="sampledata" name="sampledata"></a>
## サンプルデータ
<a id="markdown-%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF" name="%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF"></a>

### 本書で使用するサンプルデータベース
<a id="markdown-%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9" name="%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9"></a>

サンプルデータベースおよびテスト用ユーザーの作成方法は、各テスト環境のページを参照してください。

|  データベース名  |  用途  |
| ---- | ---- |
| testdb |  第1章用のごく簡単なテストデータを登録するためのデータベース<br />※第2章のテーブルの作成と削除もこのデータベースでの実行を想定しています（本文参照）。 |
| sampledb | メインで使用する「フクロウ塾」のサンプルデータ、および、第6章で使用するサンプルデータ用のデータベース |
| sampledb2 | 第7章「ケーススタディ」で新たな定義を加えたフクロウ塾のサンプルデータ用のデータベース |

### 本書で使用するサンプルデータ
<a id="markdown-%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF" name="%E6%9C%AC%E6%9B%B8%E3%81%A7%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%83%87%E3%83%BC%E3%82%BF"></a>

| ファイル名 | 内容 | インポート先 |
| ---- | ---- | ---- |
| [testdb.sql](sample/testdb.sql) | 第1章用サンプルデータ（生徒マスター、選択コース） | testdb |
| [sampledb.sql](sample/sampledb.sql) | 第2章～第7章用サンプルデータ（フクロウ塾ほか） | sampledb |
| [sampledb2.sql](sample/sampledb2.sql) | 第7章用サンプルデータ（フクロウ塾） | sampledb2 |

ファイル名をクリックするとダウンロードできます。
拡張子は「.sql」となっていますが、テキストファイルなのでメモ帳やテキストエディットなどで開いて内容を確認することができます。

#### SQL&nbsp;Server用

SQL&nbsp;Server用は❶sqlcmd.exeでの表示結果を見やすくするため文字長(255)を調整、❷`CREATE TABLE`時 `ON DELETE RESTRICT` の代わりに `ON DELETE NO ACTION` を使用しています。

| ファイル名 | 内容 | インポート先 |
| ---- | ---- | ---- |
| [testdb-sqlserver.sql](sample/testdb-sqlserver.sql) | 第1章用サンプルデータ（生徒マスター、選択コース） | testdb |
| [sampledb-sqlserver.sql](sample/sampledb-sqlserver.sql) | 第2章～第7章用サンプルデータ（フクロウ塾ほか） | sampledb |
| [sampledb2-sqlserver.sql](sample/sampledb2-sqlserver.sql) | 第7章用サンプルデータ（フクロウ塾） | sampledb2 |

#### サンプルデータをインポートするには
- [mysql/mariadbコマンドの場合（MySQL, MariaDB ※コマンド操作に慣れている人向け）](howto/import-mariadb)
- [psqlコマンドの場合（PostgreSQL ※コマンド操作に慣れている人向け）](howto/) ※準備中
- [Microsoft SQL&nbsp;Server場合](howto/) ※準備中
- [DBeaverの場合（MySQL, MariaDB, PostgreSQL, SQL&nbsp;Server）](howto/install-vmware#dbeaver-import) ※VMware+Ubuntuページ内

## 正誤表
<a id="markdown-%E6%AD%A3%E8%AA%A4%E8%A1%A8" name="%E6%AD%A3%E8%AA%A4%E8%A1%A8"></a>

| ページ | 内容 |
| ---- | ---- |
|  |  |

### 補足情報

| ページ | 内容 |
| ---- | ---- |
|  |  |

## 履歴
<a id="markdown-%E7%B7%A8%E9%9B%86%E5%B1%A5%E6%AD%B4" name="%E7%B7%A8%E9%9B%86%E5%B1%A5%E6%AD%B4"></a>

- 2024.9 サポートページ公開

----
[標準SQL＋データベース入門 <small>——RDBとDB設計、基本の力</small> サポートページ](https://nisim-m.github.io/sqlbook2/)


