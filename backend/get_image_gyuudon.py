# -*- coding: utf-8 -*-

# import
from bs4 import BeautifulSoup
import requests as req

from time import sleep
import pandas as pd
import uuid

import warnings
warnings.simplefilter("ignore")

# Web スクレイプ対象のページ URL
urls = ["https://www.yoshinoya.com/menu/gyudon/",
        "https://www.yoshinoya.com/menu/curry/",
        "https://www.yoshinoya.com/menu/set/"]

names = []
prices = []
images = []

# 取得元となる Web ページの URL
for url in urls:
    # [必須] サーバー負荷対策
    sleep(2)
    # ページ情報の取得
    response = req.get(url, verify=False)
    response.encoding = response.apparent_encoding
    soup = BeautifulSoup(response.text, "html.parser")
    menu = soup.find_all("li", class_="menu-content")

    for data in menu:
        # メニュー名と価格を取得
        names.append(data.find("h3").get_text())
        prices.append(data.find("dd").find("span").get_text())
        # メニュー画像のパスを取得
        images.append(data.find("img").get("src"))

# データフレーム　コラムは 3 つ (menu, price, image_url)
df = pd.DataFrame()
df["menu"] = names
df["price"] = prices

# メニュー画像を取得
image_url = []
for image in images:
    # [必須] サーバー負荷対策
    sleep(2)
    r = req.get(image, verify=False)

    # uuid を用いたファイル名
    file_name = '%s.%s' % (str(uuid.uuid4()), "jpg")
    image_url.append(file_name)
    with open("./image/"+file_name, "wb") as f:
        f.write(r.content)

df["image_url"] = image_url

# csv で保存
df.to_csv("../yoshinoya_menu.csv", header=True, index=False)
