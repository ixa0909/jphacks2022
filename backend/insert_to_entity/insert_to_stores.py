# -*- coding: utf-8 -*-

'''
没コード
エンティティ [stores] へレコード挿入
実行できるかは不明
'''

# import
import MySQLdb
from dotenv import load_dotenv
import os
import traceback
import pandas as pd

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
def insert_to_stores(ENTITY, COLUMNS, datas)

エンティティ [stores] へレコード挿入
例) INSERT INTO stores (name, image_url)
        VALUES ('寿司屋', '<uuid により生成した画像ファイル名>')

入力:
ENTITY: エンティティ
COLUMNS: レコード挿入時のカラム名指定
datas: 挿入する全てのレコード

出力: なし
'''


def insert_to_stores(ENTITY, COLUMNS, datas):
    # 各レコードを挿入
    for data in datas:
        try:
            # SQL の命令文を生成
            sql = "INSERT INTO %s %s VALUES (\'%s\','bnakbna')"
            # 命令文を実行
            cursor.execute(sql % (ENTITY, COLUMNS, data))
            # 保存
            connection.commit()
        except:
            # 命令文の実行が失敗した場合
            # print(traceback.format_exc())
            # 何もしない
            pass

    # データベースとの接続を終了
    connection.close()


# 店データ
stores = ['ワンカルビ', 'じゅうじゅうカルビ', 'いろり庵きらく',
          'やっぱりステーキ', 'つばめグリル', '牛繁', '吉野家',
          '一風堂', 'お好み焼ゆかり', '餃子の王将', 'かっぱ寿司',
          'や台やグループ', 'とんかつ新宿さぼてん', 'そじ坊', 'まいどおおきに食堂',
          'いきなり！ステーキ', 'たこ八', 'フライングガーデン',
          'とんかつ和幸', '三田屋本店', 'ほっかほっか亭']

# ENTITY
ENTITY = "stores"
# COLUMNS
COLUMNS = "(name, image_url)"

# エンティティ [stores] へレコード挿入
# insert_to_stores(ENTITY, COLUMNS, stores)
