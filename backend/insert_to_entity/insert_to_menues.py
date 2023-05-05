# -*- coding: utf-8 -*-

# import
import MySQLdb
from dotenv import load_dotenv
import os
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
def insert_to_menues(ENTITY, COLUMNS, all_datas)

エンティティ [menues] へレコード挿入
例) INSERT INTO menues (name, store_ids, price, image_url)
        VALUES ('はまち', '1', '110', '<uuid により生成した画像ファイル名>')

入力:
ENTITY: エンティティ
COLUMNS: レコード挿入時のカラム名指定
all_datas: 挿入する全てのレコード

出力: なし
'''


def insert_to_menues(ENTITY, COLUMNS, all_datas):
    # レコードを 1 つずつ挿入
    for datas in all_datas:
        try:
            # SQL の命令文
            sql = "INSERT INTO %s %s VALUES (\'%s\',\'%d\',\'%s\',\'%s\')"
            # 命令文の実行
            cursor.execute(
                sql % (ENTITY, COLUMNS, datas[0], datas[1], datas[2], "image/"+datas[3]))
            # データベースへの操作を保存
            connection.commit()
        except:
            # 命令が失敗した場合はエラーを出力
            # print(traceback.format_exc())
            # 何もしない
            pass

    # データベースとの接続を閉じる
    connection.close()


# エンティティの指定とそれに応じたカラム名
ENTITY = "menues"
COLUMNS = "(name, store_ids, price, image_url)"

# メニューデータの読込み
# 寿司屋もしくは牛丼屋のメニュー
df = pd.read_csv("kurazushi_menu.csv")
# df = pd.read_csv("yoshinoya_menu.csv")

# メニュー名の配列
names = df["menu"]
# 価格の配列 (数字だけに変更)
prices = df["price"].apply(lambda x: x.replace("円", ""))
# 寿司屋の ID を「1」とする
id_sushi_store = 1
# メニュー名の数だけ店 ID は共通
store_ids = [id_sushi_store for _ in range(len(names))]
image_urls = df["image_url"]

# レコードを一括
all_datas = zip(names, store_ids, prices, image_urls)

# エンティティ [menues] へレコードを挿入
insert_to_menues(ENTITY, COLUMNS, all_datas)
