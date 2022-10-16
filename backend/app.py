# -*- coding: utf-8 -*-
from flask import Flask,jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

# 日本語を使えるように
app.config['JSON_AS_ASCII'] = False
app.config['MYSQL_USER'] = 'night'
app.config['MYSQL_PASSWORD'] = '2k#TE,[PK'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/')
def CONNECT_DB():
    CS = mysql.connection.cursor()
    # CS.execute('''CREATE TABLE TABLE_NAME (id INTEGER, name VARCHAR(20))''')
    CS.execute('''INSERT INTO TABLE_NAME VALUES (1, 'Harry')''')
    CS.execute('''INSERT INTO TABLE_NAME VALUES (2, 'Arthor')''')
    mysql.connection.commit()

    CS.execute('''SELECT * FROM TABLE_NAME''')
    Executed_DATA = CS.fetchall()
    print(Executed_DATA)
    return str(Executed_DATA[1]['name'])

if __name__ == '__main__':
    app.debug = True
    app.run(host='127.0.0.1', port=8080)