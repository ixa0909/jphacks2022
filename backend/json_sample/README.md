# フロントへ渡す json 型データのサンプル

## ディレクトリ構成

```txt:サンプルデータ
json_sample
├── complete_post.json
│   メニューの達成度
├── get_history.json
│   注文履歴と来店履歴
├── get_menues.json
│   達成済みのメニューの ID とメニューの一覧
├── get_stores.json
│   店の一覧
└── README.md
    概要
```

## データサンプルの一部

- complete_post.json

```json
{
  "complete": "71%"
}
```

- get_history.json

```json
{
"order_history": [
    {
      "id": 1,
      "menu_id": 25,
      "order_time": "Sat, 22 Oct 2022 02:38:10 GMT",
      "store_id": 1,
      "user_id": "user1"
    },
    {
      "id": 2,
      "menu_id": 26,
      "order_time": "Sat, 22 Oct 2022 02:38:11 GMT",
      "store_id": 1,
      "user_id": "user1"
    }
  ],
  "store_history": []
}
```

- get_menues.json

```json
{
  "complete": [
    {
      "menu_id": 25
    },
    {
      "menu_id": 26
    },
    {
      "menu_id": 27
    },
    {
      "menu_id": 28
    }
  ],
  "menues": [
    {
      "id": 1,
      "image_url": "image/c1e95ba5-586e-407a-9b9f-83fdb16dc24b.jpg",
      "name": "【作りたて】大切り　極み熟成　まぐろ",
      "price": 165,
      "recommend": 1,
      "store_id": 1
    },
    {
      "id": 2,
      "image_url": "image/047ff3b3-d3b1-4fb4-a38d-ed91272e5fec.jpg",
      "name": "【作りたて】サーモンアボカド",
      "price": 165,
      "recommend": 0,
      "store_id": 1
    }
  ]
}
```

- get_stores.json

```json
[
  {
    "id": 1,
    "image_url": "image/ce1c12e6-8ba8-4486-946b-a9f9e35c9ca1.png",
    "name": "寿司"
  },
  {
    "id": 2,
    "image_url": "image/7d83474c-890d-48b4-9675-387a8757886b.png",
    "name": "ファミリーレストラン"
  }
]
```
