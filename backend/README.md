# バックエンドの開発

## 概要

バックエンドで用いるものをまとめている.

各ディレクトリごとに <code>README.md</code> を置いている.

## ディレクトリ構成

```:バックエンド
backend
├── /__pycache__
│   自動生成される自作モジュールの cython (高速化)
├── /json_sample
│   各機能がフロントに渡す json 型のサンプルデータ
├── .env
│   env ファイル
├── .gitignore
│   gitignore ファイル
├── app_plan.pdf
│   各機能の計画
├── app.py
│   各機能
├── db_access.py
│   自作モジュールであり, データベースログインのためのコードを簡略するため.
├── get_image_gyuudon.py
│   開発物の紹介をするために用いるサンプルデータを Web 環境から取得するコード
├── get_image_sushi.py
│   開発物の紹介をするために用いるサンプルデータを Web 環境から取得するコード
├── git_push.sh
│   github のコミット操作を簡易にするため
├── README.md
│   概要
└── requirements.txt
    python のモジュール一覧
```

## 苦労した点

初めてすることが大量であり, 期間が短期間であったこと.
Web スクレイプはしたことがあった

## 開発環境

```md
- 言語
Python (Python3) 3.11.0

- Python モジュール
flask
flask_mysqldb
dotenv (python-dotenv)
MySQLdb (mysqlclient)
pandas
```

```python
# モジュールの一括インストール
pip install -r requirements.txt
# env ファイルの生成の後, 変数を適宜設定
cp .env.sample .env
```

```txt
flask >= 2.3.2
flask_mysqldb >= 1.0.1
python-dotenv >= 0.21.0
mysqlclient >= 2.1.1
pandas >= 1.5.1
```
