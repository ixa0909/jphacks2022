# -*- coding: utf-8 -*-

# import
from flask import Flask, request, jsonify
# 自作モジュール
from db_access import db_access

# Flask API の初期宣言
app = Flask(__name__)
# データベースログイン
mysql = db_access(app)


'''
def CONNECT_DB_USER()
機能: ユーザーが新規であるかを判定
PATH: /api/login
method: POST
key: user_id
'''


@app.route('/api/login', methods=['POST'])
def CONNECT_DB_USER():
    # ユーザー ID を受け取る
    user_id = request.json["user_id"]
    # カーソルの生成
    cs = mysql.connection.cursor()
    # SQL 文の実行
    cs.execute("SELECT id FROM users where id = \'%s\'" % user_id)
    # データを一括取得
    data = cs.fetchall()

    # ユーザー ID が既存の場合
    if len(data):
        # データベースとの接続を終了
        mysql.connection.close()
        return jsonify({"IsNew": False})
    # ユーザー ID が新規の場合
    else:
        cs.execute("insert into users (id) values (\'%s\')" % user_id)
        mysql.connection.commit()
        # データベースとの接続を終了
        mysql.connection.close()
        return jsonify({"IsNew": True})


'''
def get_stores()
機能: 店一覧を渡す
PATH: /api/stores
method: GET, POST
GET の場合
なし
POST の場合
user_id, store_id
'''


@app.route('/api/stores', methods=["GET", "POST"])
def get_stores():
    # GET メソッド
    if request.method == "GET":
        # カーソルの生成
        cs = mysql.connection.cursor()
        # SQL の命令文を実行
        cs.execute("SELECT * FROM stores")
        data = cs.fetchall()
        # データベースとの接続を終了
        mysql.connection.close()
        # 店一覧のデータを返却
        return jsonify(data)

    # POST メソッド
    elif request.method == "POST":
        # ユーザー ID と店 ID をパラメータで取得
        try:
            user_id = request.json["user_id"]
            store_id = request.json["store_id"]
        except:
            return "0"
        # カーソルの生成
        cs = mysql.connection.cursor()
        # エンティティ「come_history」にレコードを挿入
        cs.execute("insert into come_history(user_id,store_id) values(\'%s\',\'%s\')" % (
            user_id, store_id))
        # 処理を保存
        mysql.connection.commit()
        # データベースとの接続を終了
        mysql.connection.close()
        return "1"
    else:
        print("想定外の request.method により処理が実行されていません.")


'''
def menues()
機能: 店 ID に応じたメニュー一覧を返す
PATH: /api/menues
method: GET, POST
key:
GET の場合
store_id, user_id
POST の場合
user_id, menu_id, store_id
戻り値は 1 もしくは 0 で処理成功なら 1 そうでなければ 0
'''


@app.route('/api/menues', methods=["GET", "POST"])
def menues():
    # GET メソッド
    if request.method == "GET":
        # パラメータ値を取得
        try:
            req = request.args
            store_id = req.get("store_id")
            user_id = req.get("user_id")
        except:
            return "0"

        # カーソルの生成
        cs = mysql.connection.cursor()
        # メニュー一覧を取得
        cs.execute("SELECT * FROM menues where store_id=\'%s\'" % store_id)
        menues = cs.fetchall()

        # おすすめメニュー一覧を取得
        cs.execute(
            "SELECT * FROM menues where recommend = true and store_id=\'%s\'" % store_id)
        recommend = cs.fetchall()

        # 過去に注文したものを取得する命令文 (未使用)
        sql = "select menu_id from (select menu_id from order_history  \
            where store_id = \'%s\' and user_id = \'%s\') as complete group by menu_id" % (store_id, user_id)
        # 達成済みのメニュー一覧を取得
        cs.execute("select * from order_history as o inner join menues as m on m.id = o.menu_id where o.user_id=\'%s\' and o.store_id = \'%s\'" % (user_id, store_id))
        complete = cs.fetchall()

        # 注意: おすすめにあるものはメニュー一覧にも入っている
        return jsonify({"complete": complete, "recommend": recommend, "menues": menues})

    # POST メソッド
    elif request.method == "POST":
        # パラメータ値を取得
        try:
            user_id = request.json["user_id"]
            menu_id = request.json["menu_id"]
            store_id = request.json["store_id"]
        except:
            return "0"
        # エンティティ「order_history」に新規レコードを挿入
        cs = mysql.connection.cursor()
        cs.execute("insert into order_history(user_id,menu_id,store_id) values(\'%s\',\'%s\',\'%s\')" % (
            user_id, menu_id, store_id))
        mysql.connection.commit()

        return "1"
    else:
        print("想定外の request.method により処理が実行されていません.")
        return "0"


'''
def check_complete()
機能: 達成度を返す
PATH: /api/check_complete
method: POST
key: user_id, store_id
戻り値は 1 もしくは 0 で処理成功なら 1 そうでなければ 0
'''


@app.route('/api/check_complete', methods=["POST"])
def check_complete():
    # パラメータを取得
    try:
        user_id = request.json["user_id"]
        store_id = request.json["store_id"]
    except:
        return "0"

    cs = mysql.connection.cursor()

    # 差分集合「not in」を用いて, 達成済みのメニュー数を取得
    # 注意: check は tuple 型
    cs.execute("select count(id) from (select menues.id from menues where store_id = \'%s\'\
                 and menues.id not in (\
                  select menu_id from order_history where user_id = \'%s\')) as not_complete" % (store_id, user_id))
    check = cs.fetchall()
    check = check[0]["count(id)"]

    # 店のメニュー数を取得
    # 注意: count_food は 辞書型
    cs.execute("select count(id) from menues where store_id = \'%s\'" % store_id)
    count_food = cs.fetchone()
    count_food = count_food["count(id)"]

    # 達成率を返す
    if check:
        return jsonify({"complete": str(100-100*check//count_food)+"%"})
    else:
        return jsonify({"complete": str(100-100*check//count_food)+"%"})


'''
def get_history()
機能: 注文履歴を返す
PATH: /api/history
method: GET
key: user_id, store_id
'''


@app.route('/api/history', methods=["GET"])
def get_history():
    # パラメータを取得
    req = request.args
    user_id = req.get("user_id")
    store_id = req.get("store_id")

    # 店の履歴を取得 (未使用)
    cs = mysql.connection.cursor()
    cs.execute("SELECT * FROM come_history WHERE user_id = \'%s\'" %
               str(user_id))
    store_history = cs.fetchall()

    # 注文の履歴を取得
    cs.execute("SELECT * FROM order_history where store_id = \'%s\'" %
               str(store_id))
    order_history = cs.fetchall()
    return jsonify(order_history)


if __name__ == '__main__':
    app.debug = True
    app.run(host="0.0.0.0", port=8080)
