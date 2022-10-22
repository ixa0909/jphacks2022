# import
from bs4 import BeautifulSoup
import requests as req
from time import sleep
import re
import csv
from tqdm import tqdm
import warnings
import pandas as pd
from bs4.element import SoupStrainer
import uuid
from time import sleep
warnings.simplefilter("ignore")


urls = ["https://www.yoshinoya.com/menu/gyudon/",
"https://www.yoshinoya.com/menu/curry/",
"https://www.yoshinoya.com/menu/set/"]

names = []
prices = []
images = []

# 取得元となる Web ページの URL 
for url in urls:
  # この時点では要らないが後で重要になる　[必須]サーバー負荷対策
  sleep(1)
  # ページ情報の取得
  response = req.get(url, verify=False)
  response.encoding = response.apparent_encoding
  soup = BeautifulSoup(response.text, "html.parser")
  
  
  df = pd.DataFrame()
  
  
  menu = soup.find_all("li",class_="menu-content")
  for data in menu:
    images.append(data.find("img").get("src"))
    
    names.append(data.find("h3").get_text())
    prices.append(data.find("dd").find("span").get_text())
    # print()
  
df["menu"]=names
# print(prices)
df["price"]=prices
  
  
image_url =[]
for image in images:
  sleep(1)
  r = req.get(image,verify=False)
  file_name = '%s.%s'%(str(uuid.uuid4()),"jpg")
  image_url.append(file_name)
  with open("./image/"+file_name,"wb") as f:
    f.write(r.content)
    
  
df["image_url"] = image_url
df.to_csv("../yoshinoya_menu.csv",header=True,index=False)