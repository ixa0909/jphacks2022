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


user_id = "user2"

for i in range(1,193,1):
    cursor.execute("insert into order_history (user_id, menu_id,store_id) values (\'%s\',\'%s\',1)"%(user_id,str(i)))
    connection.commit()

connection.close()