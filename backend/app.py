# -*- coding: utf-8 -*-

from flask import *
from db_access import db_access

app = Flask(__name__)
mysql = db_access(app)


# ログイン処理
@app.route('/api/login',methods=['POST'])
def CONNECT_DB_USER():
    user_id = request.json["user_id"]
    
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
@app.route('/api/stores',methods=["GET", "POST"])
def get_stores():
    if request.method == "GET":
        cs = mysql.connection.cursor()
        cs.execute("SELECT * FROM stores")
        data = cs.fetchall()

        return jsonify(data)
        
    else: # request.method == "POST" を想定
    # 来店履歴に登録
        try:
            user_id = request.json["user_id"]
            store_id = request.json["store_id"]
        except:
            return "0"
            
        cs = mysql.connection.cursor()
        cs.execute("insert into come_history(user_id,store_id) values(\'%s\',\'%s\')"%(user_id,store_id))
        mysql.connection.commit()

        return "1"


# メニュー一覧を store_id に応じて返す
@app.route('/api/menues',methods=["GET","POST"])
def menues():
    if request.method == "GET":
        try:
            req = request.args
            store_id = req.get("store_id")
            user_id = req.get("user_id")
        except:
            return "0"

        cs = mysql.connection.cursor()
        cs.execute("SELECT * FROM menues where store_id=\'%s\'"%store_id)
        menues = cs.fetchall()
        
        cs.execute("SELECT * FROM menues where recommend=true and store_id=\'%s\'"%store_id)
        recommend = cs.fetchall()

        sql = "select menu_id from (select menu_id from order_history  \
            where store_id = \'%s\' and user_id = \'%s\') as complete group by menu_id"%(store_id,user_id)
        
        cs.execute("select * from order_history as o inner join menues as m on m.id = o.menu_id where o.user_id=\'%s\' and o.store_id = \'%s\'"%(user_id,store_id))
        complete = cs.fetchall()

        # おすすめにあるものはメニュー一覧にも入れている
        return jsonify({"complete":complete,"recommend":recommend,"menues":menues})
    else: # request.method == "POST" を想定
        try:
            user_id = request.json["user_id"]
            menu_id = request.json["menu_id"]
        except: 
            return "0"

        cs = mysql.connection.cursor()
        cs.execute("insert into come_history(user_id,store_id) values(\'%s\',\'%s\')"%(user_id,menu_id))
        mysql.connection.commit()
        
        # 完了に応じた番号（値）を戻り値にする
        return "1"

# 達成度を表示(コンプリート画面)
@app.route('/api/check_complete',methods=["POST"])
def check_complete():
    try:
        user_id = request.json["user_id"]
        store_id = request.json["store_id"] 
    except:
        return "0"
   
    cs = mysql.connection.cursor()
    
    # mysql における差分集合 ↓store_id を order_history に加えたので変更した方が良さそう
    # https://qiita.com/Hiraku/items/71873bf31e503eb1b4e1
    cs.execute("select count(id) from (select menues.id from menues where store_id = \'%s\'\
                 and menues.id not in (\
                  select menu_id from order_history where user_id = \'%s\')) as not_complete"%(store_id, user_id))
    
    check = cs.fetchall()
    # check は tuple 型
    check =check[0]["count(id)"]
    # 制覇率を渡す
    # 店の商品数を計算する
    cs.execute("select count(id) from menues where store_id = \'%s\'"%store_id)
    count_food = cs.fetchone()
    # count_food は 辞書型
    count_food = count_food["count(id)"]

    if check:
        return jsonify({"complete":str(100*check//count_food)+"%"})
    else:
        return jsonify({"complete":str(100*check//count_food)+"%"})
    
# 履歴を表示
@app.route('/api/history',methods=["GET"])
def get_history():
    req = request.args
    store_id = req.get("store_id")
    user_id = req.get("user_id")

    # 店の履歴
    cs = mysql.connection.cursor()
    cs.execute("SELECT * FROM come_history WHERE user_id = \'%s\'"%str(user_id))
    store_history = cs.fetchall()
    
    # 注文の履歴
    cs.execute("SELECT * FROM order_history where store_id = \'%s\'"%str(store_id))
    order_history = cs.fetchall()
    return jsonify({"store_history":store_history,"order_history":order_history})
        
# 履歴を表示
# @app.route('/api/recommend',methods=["POST"])
# def get_history():
#     req = request.args
#     store_id = req.get("user_id")
#     user_id = req.get("store_id")

#     # 店の履歴
#     cs = mysql.connection.cursor()
#     cs.execute("SELECT menu_id from order_history where order_time = (select max(order_time))from)
#     store_history = cs.fetchall()
    
#     # 注文の履歴
#     cs.execute("SELECT * FROM order_history where store_id = \'%s\'"%str(store_id))
#     order_history = cs.fetchall()
#     return jsonify({"store_history":store_history,"order_history":order_history})
        
if __name__ == '__main__':
    app.debug = True
    app.run(host="0.0.0.0",port=8080)