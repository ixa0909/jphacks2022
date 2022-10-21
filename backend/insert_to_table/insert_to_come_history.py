# -*- coding: utf-8 -*-

import MySQLdb
from dotenv import load_dotenv
import os

# データベースログインの PASS を取得
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


for i in range(1,5):
    user_id = "user" + str(i)
    for j in range(1,3):
        store_id = str(j)
        cursor.execute("insert into come_history(user_id,store_id) values (\'%s\',\'%s\') "%(user_id,store_id))
        connection.commit()

connection.close()