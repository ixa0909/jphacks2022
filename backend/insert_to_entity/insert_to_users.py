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
エンティティ「users」に「user1 ~ 10」を挿入
データベースの構想時には (<ユーザ名>, <メールアドレス>, <パスワード>)
を挿入予定であったが <ユーザー名> のみを持つレコードを挿入
'''

ENTITY = "users"
for i in range(1, 10):
    user_id = "user" + str(i)
    # SQL の命令文を実行
    cursor.execute("insert into \'%s\' (id) values (\'%s\')" %
                   (ENTITY, user_id))
    # 保存
    connection.commit()

# データベースとの接続を終了
connection.close()
