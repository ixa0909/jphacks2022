# -*- coding: utf-8 -*-
from flask import Flask,jsonify

app = Flask(__name__)

# 日本語を使えるように
app.config['JSON_AS_ASCII'] = False

@app.route('/')
def index():
    data = {
        "id": "tガバbヴァ馬",
        "name": "test"
    }
    return jsonify(data)


if __name__ == '__main__':
    app.debug = True
    app.run()