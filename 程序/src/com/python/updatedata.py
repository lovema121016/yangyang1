
import requests, re, datetime
from bs4 import BeautifulSoup
import urllib
import xlsxwriter
import threading
import cx_Oracle
# import paqu_comment
def generateURL(good, pages=5):
    url_str = urllib.parse.quote(good)
    urls = ("https://search.jd.com/Search?keyword={}&enc=utf-8&qrst=1&rt=1&stop=1&vt=2&offset=4&page={}&s=1&click=0".format(url_str, i) for i in range(1, pages*2, 2))
    print(urls)
    return urls


def get_html(url):
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36",
            'ContentType': 'text/html; charset=utf-8',
            'Accept-Encoding': 'gzip, deflate, sdch',
            'Accept-Language': 'zh-CN,zh;q=0.8',
            'Connection': 'keep-alive'
        }
        html = requests.get(url, headers=headers, timeout=30)
        html.encoding = html.apparent_encoding
        return html
    except:
        return '获取HTML失败'


def parsePage(html):
    soup = BeautifulSoup(html.text, 'lxml')
    titles = soup.find_all(class_="p-name p-name-type-2")
    prices = soup.find_all(class_="p-price")
    commits = soup.find_all(class_="p-commit")
    imgs = soup.find_all(class_="p-img")
    shop = soup.find_all(class_="curr-shop")

    return zip(titles, prices, commits, imgs, shop)


def createListHeader(workbook):
    worksheet = workbook.add_worksheet()
    bold = workbook.add_format({'bold': True, 'font_color': 'red','align':'center'})
    worksheet.write('A1', '标题', bold)
    worksheet.write('B1', '店铺', bold)
    worksheet.write('C1', '价格', bold)
    worksheet.write('D1', '评价', bold)
    worksheet.write('E1', '好评率', bold)
    worksheet.write('F1', '链接', bold)
    worksheet.write('G1', '图片', bold)
    worksheet.write('H1', '商品介绍', bold)
    worksheet.write('I1', '品牌', bold)

    # 设置列宽度
    worksheet.set_column('A:A', 120)
    worksheet.set_column('B:B', 20)
    worksheet.set_column('C:C', 8)
    worksheet.set_column('D:D', 16)
    worksheet.set_column('E:E', 16)
    worksheet.set_column('F:F', 30)
    worksheet.set_column('G:G', 30)
    worksheet.set_column('H:H', 30)
    worksheet.set_column('I:I', 15)
    return worksheet

#下载图片
def downloadJPG(imgUrl, fileName):
    urllib.urlretrieve(imgUrl, fileName)
def storeGoodsList(good,data_, worksheet, row=1):
    col = 0

    for title, price, commit, img, shop in data_:
      try:
        res_price = re.match('^(￥\d+)', price.text.strip())  # 去除多余￥
        res_shop = re.match('^<a.+title="(.+)">', str(shop))
        lin=img.find_all('a')[0].get("href").split(';')[0]
        image = img.find('img').get('source-data-lazy-img')  # 文章图片
        item = title.find('a')
        #print(item)
        path = 'E:/20163587_姚雅丽/毕设/商品图片/毛戈平/'  #图片存储位置
        src1='http:' + image
        print(src1)
        #好评率，评价人数####################################################
        item_id = re.search(r'(\d+)', item['href']).group()


        img = 'http:' + image  # 这里废了好长的时间，原来网站必须要有http：的
        #print(img)
        urllib.request.urlretrieve(img, ''.join([path, '{0}.jpg'.format(item_id)]))  #下载图片 命名为item_id.jpg

        print("yaoyao1")
        url = f'https://sclub.jd.com/comment/productPageComments.action?productId={item_id}&score=0&sortType=5&page=0&pageSize=10&isShadowSku=0&fold=1'
        headers = {
            "referer": f"https://item.jd.com/{item_id}.html",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 SE 2.X MetaSr 1.0"
        }
        response = requests.get(url, headers=headers)
        print("yaoyao1")
        with open('html.json', 'w', encoding='utf8') as f:
            f.write(response.text)
        data = response.json()
        comment_count = data['productCommentSummary']['commentCount']  #评价人数
        #print('评价人数：', comment_count)
        good_rate = data['productCommentSummary']['goodRate']  #好评率
        #print('好评率：', good_rate)
        #####################################################################
        #paqu_comment.run(item_id, lin)  #爬取相关评论


        if lin[0]!='h':
            lin='https:'+lin
        #print(commit)
        print('1')
        response = requests.get(lin, headers=headers)
        # print(response.text)
        soup = BeautifulSoup(response.text, 'lxml')
        content1 = soup.find('ul', {'class': 'parameter2 p-parameter-list'})

        content1 = content1.text  # 商品介绍

        #content2 = soup.find('div', {'class': 'tab-con'})
        # content2 = soup.find('div', {'class': 'Ptable'})
        # content2 = content2.text  # 规格与包装
        print('2')
        data = {
            'title' :   title.text.strip().split('\n')[0],   #标题
            'price' :   res_price.group(1),   #价格

            'commit':   comment_count,    #评论数
            'good_rate': good_rate,    #好评率
            'link'  :   lin,  #连接
            'shop'  :   res_shop.group(1),   #店铺
            'image' :  item_id+".jpg",    #商品图片
            'remark' : content1,   #商品介绍
            'brand' : good    #品牌
        }

        #写入数据库中
        conn = cx_Oracle.connect('C##CHINA_GOOD/bishe@127.0.0.1:1521/ORCL')
        cursor = conn.cursor()
        sql3 = "insert into goodd(name,shop,price,comment_number,good_rate,link,brand,image,reamek) values('%s','%s','%s','%s','%s','%s','%s','%s','%s')" \
               % (data['title'], data['shop'], data['price'], data['commit'], data['good_rate'], data['link'], data['brand'], data['image'], data['remark'])
        cursor.execute(sql3)
        conn.commit()
        conn.close()
        #写入xlxs中
        worksheet.write(row, col, data['title'])
        worksheet.write(row, col+1, data['shop'])
        worksheet.write(row, col+2, data['price'])
        worksheet.write(row, col+3, data['commit'])
        worksheet.write(row, col+4, data['good_rate'])
        worksheet.write(row, col+5, data['link'])
        worksheet.write(row, col+6, data['image'])
        worksheet.write(row, col+7, data['remark'])
        worksheet.write(row, col+8, data['brand'])
        row += 1
      except:
          print("爬取信息不全，删除！")

def main(good, pages):
    workbook = xlsxwriter.Workbook("爬取数据/"+good +  '.xlsx')  # 创建表
    worksheet = createListHeader(workbook)
    urls = generateURL(good, pages=pages)       # 生成URLs
    row = 1                                     # 第一行开始写入
    print("\n开始爬取京东商品信息\n")
    for url in urls:
        try:
            html = get_html(url)
            data = parsePage(html)
            time = datetime.datetime.now()
            print(str(time)[11:19] +" 正在爬取 " + good + " 的第 "+str(row//25+1)+" 页内容")
            storeGoodsList(good, data, worksheet, row)
            row += 25
        except:
            print(url, " 页面出错")
            continue

    try:
        print("\n 存储成功！")
        workbook.close()
        print("\n ------爬取结束------")
    except:
        print("\n-------------------文档关闭失败----------------\n")
        print("--------------请先关闭 Excel 再重新爬取--------")

import sys
if __name__ == '__main__':
    brand = []
    for i in range(1, len(sys.argv)):
        brand.append(sys.argv[i])
    good = brand
    pages = 60
    main(good, pages)
