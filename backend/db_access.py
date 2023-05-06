# -*- coding: utf-8 -*-

# import
from dotenv import load_dotenv
import os
from flask_mysqldb import MySQL

# データベースログインのパラメータを取得
def db_access(app):
    load_dotenv(override=True)
    PASSWORD = os.getenv('DATABASE_PASSWORD')
    MYSQL_USER = os.getenv('MYSQL_USER')
    MYSQL_HOST = os.getenv('MYSQL_HOST')
    MYSQL_DB = os.getenv('MYSQL_DB')

    # 日本語を使えるように
    app.config['JSON_AS_ASCII'] = False

    app.config['MYSQL_USER'] = MYSQL_USER
    app.config['MYSQL_PASSWORD'] = PASSWORD
    app.config['MYSQL_HOST'] = MYSQL_HOST
    app.config['MYSQL_DB'] = MYSQL_DB
    app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

    return MySQL(app)