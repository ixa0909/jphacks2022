# MySQLdbのインポート
import MySQLdb
from dotenv import load_dotenv
import os
import traceback

# データベースログインの PASS を取得
load_dotenv(override=True)
PASSWORD = os.getenv('DATABASE_PASSWORD')

# データベースへの接続とカーソルの生成
connection = MySQLdb.connect(
    host='localhost',
    user='night',
    passwd=PASSWORD,
    db='test')
cursor = connection.cursor()

def insert_to_db(datas,table,column):
# ここに実行したいコードを入力します
    for data in datas:
        # try 可能なら　except 失敗したなら
        try:
            cursor.execute("""INSERT INTO """+table+column+""" VALUES (\'"""+data+"""\')""")
            # 保存を実行
            connection.commit()
        except:
            # エラーメッセージを出力
            # print(traceback.format_exc())
            pass# 何もしない
        
    # 接続を閉じる
    connection.close()

# VALUE
datas = ['ワンカルビ', 'じゅうじゅうカルビ', 'いろり庵きらく', 'やっぱりステーキ', 'つばめグリル', '牛繁', '吉野家', '一風堂', 'お好み焼ゆかり', 
            '餃子の王将', 'かっぱ寿司', 'や台やグループ', 'とんかつ新宿さぼてん', 'そじ坊', 'まいどおおきに食堂', 'いきなり！ステーキ', 'たこ八', 'フライングガーデン', 
            'とんかつ和幸', '三田屋本店', 'ほっかほっか亭']
# TABLE
table = "store"
# COLUMN
column = "(name)"

insert_to_db(datas,table,column)