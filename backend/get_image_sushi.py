# -*- coding: utf-8 -*-
# import
from bs4 import BeautifulSoup
import requests as req
from time import sleep
from tqdm import tqdm
import warnings
import pandas as pd
import uuid
from time import sleep
warnings.simplefilter("ignore")

# 取得元となる Web ページの URL 
url="https://www.kurasushi.co.jp/menu/?area=area0"

# この時点では要らないが後で重要になる　[必須]サーバー負荷対策
sleep(1)
# ページ情報の取得
response = req.get(url, verify=False)
response.encoding = response.apparent_encoding
soup = BeautifulSoup(response.text, "html.parser")

images = []
for data in soup.find_all("div",class_="menu-thumbnail"):
  image = data.find("img").get("src")
  if image[0]==".":
    image = "https://www.kurasushi.co.jp/menu"+image[1:]
  else:
    image = "https://www.kurasushi.co.jp"+image
  images.append(image)
menues = soup.find_all("h4",class_="menu-name")

names = []
for data in menues:
  names.append(data.get_text())
# print(soup.find_all("p"))
menues = soup.find_all("ul" ,class_="menu-summary")
prices = []
for data in menues:
  prices.append(data.find_all("p")[0].get_text())

df = pd.DataFrame()
df["menu"] = names
df["price"] = prices
# https://www.kurasushi.co.jp/menu/upload/6821feec7cc136706ba7a7e233cf88e03c5de3ed.jpg
# https://www.kurasushi.co.jp/menu/images_menu/77cbb3efc447e10ada50fb7cab2fad1843f93e1c.jpg

image_url = []

for image in tqdm(images):
  sleep(1)
  r = req.get(image,verify=False)
  file_name = '%s.%s'%(str(uuid.uuid4()),"jpg")
  image_url.append(file_name)
  with open("./image/"+file_name,"wb") as f:
    f.write(r.content)
  

df["image_url"] = image_url
df.to_csv("../kurazushi_menu.csv",header=True,index=False)