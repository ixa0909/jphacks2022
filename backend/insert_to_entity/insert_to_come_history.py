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

'''
エンティティ [come_history] へ試験用レコードを挿入
user1 ~ user4 が store1 ~ store2 に来店したことを表すレコードを挿入
'''

N_guest = 5
N_store = 3

# 試験用のレコードを生成しエンティティへ挿入
for i in range(1, N_guest):
    user_id = "user" + str(i)
    for j in range(1, N_store):
        store_id = str(j)
        # レコード挿入
        cursor.execute("insert into come_history(user_id,store_id) values (\'%s\',\'%s\') " % (
            user_id, store_id))
        connection.commit()

# データベースとの接続を終了
connection.close()
