# -*- coding: utf-8 -*-
from flask import Flask,jsonify
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

@app.route('/')
def CONNECT_DB_STORE():
    CS = mysql.connection.cursor()
    CS.execute("INSERT INTO store(name) VALUES ('くら寿司')")
    mysql.connection.commit()

    CS.execute('''SELECT * FROM store''')
    Executed_DATA = CS.fetchall()
    print()
    return jsonify(Executed_DATA)

@app.route('/login/')
def CONNECT_DB_USER():
    # フロントからデータを受け取って挿入と照合したい
    CS = mysql.connection.cursor()
    # CS.execute("INSERT INTO store(name) VALUES ('くら寿司')")
    # mysql.connection.commit()

    CS.execute('''SELECT * FROM user''')
    Executed_DATA = CS.fetchall()
    print()
    return jsonify(Executed_DATA)

if __name__ == '__main__':
    app.debug = True
    app.run(port=8080)