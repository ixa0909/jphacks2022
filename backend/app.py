# -*- coding: utf-8 -*-
from flask import Flask,jsonify
from flask_mysqldb import MySQL
from dotenv import load_dotenv
import os


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
def CONNECT_DB():
    CS = mysql.connection.cursor()
    # CS.execute('''CREATE TABLE TABLE_NAME (id INTEGER, name VARCHAR(20))''')
    CS.execute('''INSERT INTO store VALUES (1, 'くら寿司')''')
    CS.execute('''INSERT INTO store VALUES (2, 'いきなりステーキ')''')
    mysql.connection.commit()

    CS.execute('''SELECT * FROM store''')
    Executed_DATA = CS.fetchall()
    print()
    return jsonify(Executed_DATA)

if __name__ == '__main__':
    app.debug = True
    app.run(host='127.0.0.1', port=8080)