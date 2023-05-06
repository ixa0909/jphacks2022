# -*- coding: utf-8 -*-

# import
from bs4 import BeautifulSoup
import requests as req

from tqdm import tqdm
import pandas as pd
import uuid
from time import sleep

import warnings
warnings.simplefilter("ignore")

# Web スクレイプ対象のページ URL
url = "https://www.kurasushi.co.jp/menu/?area=area0"


# ページ情報の取得
response = req.get(url, verify=False)
response.encoding = response.apparent_encoding
soup = BeautifulSoup(response.text, "html.parser")

# メニュー画像のパスを取得
images = []
for data in soup.find_all("div", class_="menu-thumbnail"):
    image = data.find("img").get("src")
    if image[0] == ".":
        image = "https://www.kurasushi.co.jp/menu"+image[1:]
    else:
        image = "https://www.kurasushi.co.jp"+image
    images.append(image)

# メニュー名を取得
menues = soup.find_all("h4", class_="menu-name")
names = []
for data in menues:
    names.append(data.get_text())

# 価格を取得
menues = soup.find_all("ul", class_="menu-summary")
prices = []
for data in menues:
    prices.append(data.find_all("p")[0].get_text())

# データフレーム　コラムは 3 つ (menu, price, image_url)
df = pd.DataFrame()
df["menu"] = names
df["price"] = prices

# メニュー画像を取得
image_url = []
for image in tqdm(images):
    # [必須] サーバー負荷対策
    sleep(2)
    r = req.get(image, verify=False)
    file_name = '%s.%s' % (str(uuid.uuid4()), "jpg")
    image_url.append(file_name)
    with open("./image/"+file_name, "wb") as f:
        f.write(r.content)
df["image_url"] = image_url

# csv で保存
df.to_csv("../kurazushi_menu.csv", header=True, index=False)
