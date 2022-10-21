# -*- coding: utf-8 -*-

import MySQLdb
from dotenv import load_dotenv
import os
import traceback
import pandas as pd

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

# menues への insert 
def insert_to_menues(table,columns,all_datas):
    for datas in all_datas:
        # try 可能なら　except 失敗したなら
        try: 
            sql = "INSERT INTO %s %s VALUES (\'%s\',\'%d\',\'%s\',\'%s\')"
            cursor.execute(sql % (table, columns, datas[0],datas[1],datas[2],"image/"+datas[3]))
            # 保存を実行
            connection.commit()
        except:
            # エラーメッセージを出力
            # print(traceback.format_exc())
            pass# 何もしない
        
    # 接続を閉じる
    connection.close()

table = "menues"
columns = "(name,store_id,price,image_url)"

# データの読み込み。先頭で import pandas as pd としている
df = pd.read_csv("kurazushi_menu.csv")
# print(df.head())

names = df["menu"]
prices = df["price"].apply(lambda x: x.replace("円",""))
store_id = [1 for _ in range(len(names))] # 寿司
image_urls = df["image_url"]
all_datas = zip(names, store_id,prices, image_urls)
insert_to_menues(table,columns,all_datas)


# 没コード
def insert_to_stores(table,column,datas):
    for data in datas:
        # try 可能なら　except 失敗したなら
        try:
            
            sql = "INSERT INTO %s %s VALUES (\'%s\','bnakbna')"
            cursor.execute(sql % (table, column, data))
            # 保存を実行
            connection.commit()
        except:
            # エラーメッセージを出力
            print(traceback.format_exc())
            pass# 何もしない
        
    # 接続を閉じる
    connection.close()

# VALUE
stores = ['ワンカルビ', 'じゅうじゅうカルビ', 'いろり庵きらく', 'やっぱりステーキ', 'つばめグリル', '牛繁', '吉野家', '一風堂', 'お好み焼ゆかり', 
            '餃子の王将', 'かっぱ寿司', 'や台やグループ', 'とんかつ新宿さぼてん', 'そじ坊', 'まいどおおきに食堂', 'いきなり！ステーキ', 'たこ八', 'フライングガーデン', 
            'とんかつ和幸', '三田屋本店', 'ほっかほっか亭']

# TABLE
table = "stores"
# COLUMN
column = "(name,image_url)"

# store への insert
# insert_to_stores(stores,table,column)
