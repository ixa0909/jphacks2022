# -*- coding: utf-8 -*-
from crypt import methods
from flask import *
from flask_mysqldb import MySQL
from dotenv import load_dotenv
import os

# データベースログインの PASS を取得
load_dotenv(override=True)
PASSWORD = os.getenv('DATABASE_PASSWORD')

app = Flask(__name__)

# 日本語を使えるように
app.config['JSON_AS_ASCII'] = False
app.config['MYSQL_USER'] = 'night'
app.config['MYSQL_PASSWORD'] = PASSWORD
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

# 店一覧を表示
@app.route('/stores')
def get_stores():
    CS = mysql.connection.cursor()
    # CS.execute("INSERT INTO stores(name,image_url) VALUES ('くら寿司','avbaaba')")
    # mysql.connection.commit()

    CS.execute("SELECT * FROM stores")
    data = CS.fetchall()
    return jsonify(data)

# 来店履歴に登録
@app.route('/come_history',methods=["POST"])
def add_come_history():
    try:
        user_id = request.form["user_id"]
        store_id = request.form["store_id"]
    except:
        return 0
        
    CS = mysql.connection.cursor()
    CS.execute("insert into come_history(user_id,store_id) values("+user_id+","+store_id+")")

    mysql.connection.commit()
    return 0

# 注文履歴に登録
@app.route('/order_history',methods=["POST"])
def add_order_history():
    try:
        user_id = request.form["user_id"]
        menu_id = request.form["menu_id"]
    except:
        return 400

    CS = mysql.connection.cursor()
    CS.execute("insert into come_history(user_id,store_id) values("+user_id+","+menu_id+")")

    mysql.connection.commit()
    return 400

# メニュー一覧を store_id に応じて返す
@app.route('/menues',methods=["GET"])
def menues():
    req = request.args
    store_id = req.get("store_id")

    CS = mysql.connection.cursor()

    CS.execute("SELECT * FROM menues where store_id="+store_id)
    menues = CS.fetchall()
    # print(menues)
    
    CS.execute("SELECT * FROM menues where recommend=true and store_id="+store_id)
    recommend = CS.fetchall()
    # print(recommend)
    # おすすめはメニューとで重複して渡している
    return jsonify(recommend+menues)#,jsonify(recommend)

    

# ログイン処理
@app.route('/login/',methods=['POST'])
def CONNECT_DB_USER():
    user = request.form["user"]
    # print(user)
    # フロントからデータを受け取って挿入と照合したい
    CS = mysql.connection.cursor()
    # CS.execute("INSERT INTO stores(name) VALUES ('くら寿司')")
    # mysql.connection.commit()

    CS.execute("SELECT id FROM users where id = '1'")
    data = CS.fetchall()
    if len(data):
        return jsonify(data)
    else:
        return "新規です"

if __name__ == '__main__':
    app.debug = True
    app.run(port=8080)