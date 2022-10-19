# -*- coding: utf-8 -*-

from dotenv import load_dotenv
import os
from flask_mysqldb import MySQL

def db_access(app):

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

    return MySQL(app)