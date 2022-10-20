# -*- coding: utf-8 -*-

from flask import *
# from db_access import db_access

app = Flask(__name__)

# データベースへのアクセスを認証

from dotenv import load_dotenv
import os
from flask_mysqldb import MySQL



# データベースログインの PASSWORD を取得
load_dotenv(override=True)
PASSWORD = os.getenv('DATABASE_PASSWORD')

# 日本語を使えるように
app.config['JSON_AS_ASCII'] = False
app.config['MYSQL_USER'] = 'night'
app.config['MYSQL_PASSWORD'] = PASSWORD
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/',methods=['GET'])
def CONNECT_DB_USER():
    return "hello"

# ログイン処理
@app.route('/login',methods=['POST'])
def CONNECT_DB_USER():
    user_id = request.form["user_id"]
    
    # フロントからデータを受け取って挿入と照合したい
    cs = mysql.connection.cursor()

    cs.execute("SELECT id FROM users where id = %s"%user_id)
    data = cs.fetchall()
    if len(data):
        return jsonify({"IsNew": False})
    else:
        cs.execute("insert into users (id) values (\'%s\')"%user_id)
        mysql.connection.commit()
        return jsonify({"IsNew": True})

# 店一覧を表示
@app.route('/stores',methods=["GET", "POST"])
def get_stores():
    if request.method == "GET":
        cs = mysql.connection.cursor()
        cs.execute("SELECT * FROM stores")
        data = cs.fetchall()

        return jsonify(data)
        
    else: # request.method == "POST" を想定
    # 来店履歴に登録
        try:
            user_id = request.form["user_id"]
            store_id = request.form["store_id"]
        except:
            return "0"
            
        cs = mysql.connection.cursor()
        cs.execute("insert into come_history(user_id,store_id) values("+user_id+","+store_id+")")
        mysql.connection.commit()

        return "1"


# メニュー一覧を store_id に応じて返す
@app.route('/menues',methods=["GET","POST"])
def menues():
    if request.method == "GET":
        req = request.args
        store_id = req.get("store_id")

        cs = mysql.connection.cursor()
        cs.execute("SELECT * FROM menues where store_id="+store_id)
        menues = cs.fetchall()
        # print(menues)
        
        cs.execute("SELECT * FROM menues where recommend=true and store_id="+store_id)
        recommend = cs.fetchall()
        # print(recommend)

        # おすすめはメニューとで重複して渡している
        return jsonify({"recommend":recommend,"menues":menues})
    else: # request.method == "POST" を想定
        try:
            user_id = request.form["user_id"]
            menu_id = request.form["menu_id"]
        except: 
            return "0"

        cs = mysql.connection.cursor()
        cs.execute("insert into come_history(user_id,store_id) values("+user_id+","+menu_id+")")
        mysql.connection.commit()
        
        # 完了に応じた番号（値）を戻り値にする
        return "0"

# 達成度を表示(コンプリート画面)
@app.route('/check_complete',methods=["POST"])
def check_complete():
    try:
        user_id = request.form["user_id"]
        store_id = request.form["store_id"]
    except:
        return "0"

    cs = mysql.connection.cursor()

    # コードの動き確認用
    for i in range(1,50):
        cs.execute("insert into order_history (user_id, menu_id,store_id) values ('1',"+str(i)+",'1')")
    mysql.connection.commit()

    # mysql における差分集合 ↓store_id を order_history に加えたので変更した方が良さそう
    # https://qiita.com/Hiraku/items/71873bf31e503eb1b4e1
    cs.execute("select count(id) from (select menues.id from menues where store_id = "+store_id+\
                " and menues.id not in (\
                  select menu_id from order_history where user_id = "+user_id+")) as not_complete")

    check = cs.fetchall()
    # check は tuple 型
    check =check[0]["count(id)"]
    # 制覇率を渡す
    # 店の商品数を計算する
    cs.execute("select count(id) from menues where store_id = "+store_id)
    count_food = cs.fetchone()
    # count_food は 辞書型
    count_food = count_food["count(id)"]
    if check:
        
        return jsonify({"complete":str(100*check//count_food)+"%"})
    else:
        return jsonify({"complete":str(100*check//count_food)+"%"})
    
# 履歴を表示
@app.route('/history',methods=["GET"])
def get_history():
    req = request.args
    store_id = req.get("store_id")
    user_id = req.get("user_id")

    # 店の履歴
    cs = mysql.connection.cursor()
    cs.execute("SELECT * FROM come_history WHERE user_id = "+str(user_id))
    store_history = cs.fetchall()
    
    # 注文の履歴
    cs.execute("SELECT * FROM order_history where store_id = "+str(store_id))
    order_history = cs.fetchall()
    return jsonify({"store_history":store_history,"order_history":order_history})
        

if __name__ == '__main__':
    # app.debug = True
    app.run(host="0.0.0.0",port=8080)