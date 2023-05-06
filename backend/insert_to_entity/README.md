# データベースへの処理を自動化

## 概要

<p align="center">
<img src = ../../imageForREADME/database.png style ="width:300pt;height:auto;"/>
</p>

上図に示す構造を持つデータベースを開発物に用いている. 効率化を目的として, このデータベースのエンティティにレコードを挿入をするコードを作成した.

## ディレクトリ構成

```:データベース処理
insert_to_entity
├── .env
│   データベースログインに用いるパラメータ
├── insert_to_come_history.py
│   エンティティ [come_history] へ試験用レコードを挿入
├── insert_to_menues.py
│   エンティティ [menues] へレコード挿入
├── insert_to_order_history.py
│   エンティティ [order_history]に試験レコードを挿入
├── insert_to_stores.py
│   エンティティ [stores] へレコード挿入
├── insert_to_users.py
│   エンティティ「users」に試験用レコードを挿入
├── kurazushi_menu.csv
│   メニューのデータサンプル 1
│   コラム: menu,price,image_url
├── README.md
│   概要
├── requirements.txt
│   python モジュールの一括インストール用
└── yoshinoya_menu.csv
    コラム: menu,price,image_url
```

## 開発環境

```md
- 言語
Python (Python3) 3.11.0

- Python モジュール
MySQLdb (mysqlclient) 2.1.1
dotenv (python-dotenv) 0.21.0
pandas 1.5.1
```

```python
# モジュールの一括インストール
pip install -r requirements.txt
# env ファイルの生成の後, 変数を適宜設定
cp .env.sample .env
```

## 課題

以下に示すコード部分が共通であり, コードをひとまとめにしたり, このコードを各コードから参照できるようにしたりすることでコードの冗長性を解消したい. </dr>
また, セキュリティ対策として, ログインセッションの管理や SQL インジェクション対策を今後の開発では実装していく.

```python
# データベースログインのパラメータ
load_dotenv(override=True)
PASSWORD = os.getenv('DATABASE_PASSWORD')
MYSQL_USER = os.getenv('MYSQL_USER')
MYSQL_HOST = os.getenv('MYSQL_HOST')
MYSQL_DB = os.getenv('MYSQL_DB')

# データベースへの接続とカーソルの生成
connection = MySQLdb.connect(
    host=MYSQL_HOST,
    user=MYSQL_USER,
    passwd=PASSWORD,
    db=MYSQL_DB)
cursor = connection.cursor()
```
