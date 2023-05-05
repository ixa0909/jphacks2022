# -*- coding: utf-8 -*-

# import
import MySQLdb
from dotenv import load_dotenv
import os

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

# 「user2」 が 店 ID「1」でメニュー「1 ~ 20」を注文したことを表すレコードを挿入
user_id = "user2"
store_id = "1"
menu_ids = range(1, 21)

for i in menu_ids:
    # SQL の命令文を実行
    cursor.execute(
        "insert into order_history (user_id, menu_id, store_id) values (\'%s\',\'%s\',\'%s\')" % (user_id, str(i), store_id))
    # 処理を保存
    connection.commit()

# データベースとの接続を終了
connection.close()
