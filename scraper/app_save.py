from flask import Flask, jsonify, request
import json
import os
import csv
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.chrome.options import Options
from time import sleep
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
import json
application = Flask(__name__)

# Only enable Flask debugging if an env var is set to true
application.debug = os.environ.get('FLASK_DEBUG') in ['true', 'True']

# Get application version from env
app_version = os.environ.get('APP_VERSION')

@application.route('/', methods = ['GET', 'POST'])
def test():
    return "success"

@application.route('/scrape', methods = ['GET', 'POST'])
def get():
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    url = request.args.get('url')
    uid = request.args.get('id')
    driver = webdriver.Chrome('./driver/chromedriver',chrome_options=options)
    # driver.get('https://pune.craigslist.org/d/jobs/search/jjj')
    driver.get(url)
    contents = driver.page_source
    soup = BeautifulSoup(contents, features="html.parser")
    sleep(5)
    # info = {'email' : "", 'title': "", 'info' : "",'job_type' : "",'compensation': "",'time' : ''}
    data = {}
    i = 1
    j = 0
    linklist = soup.find("ul", attrs={'class': 'rows'})
    for entry in linklist.findAll('li', attrs={'class': 'result-row'}):
        if i < 11:
            i += 1
            continue
        info = {}
        a = entry.find('a', attrs={'class': 'result-image'})
        link = a.attrs['href']
        link_driver = webdriver.Chrome('./driver/chromedriver', chrome_options=options)
        link_driver.get(link)
        sleep(2)
        link_contents = link_driver.page_source
        link_soup = BeautifulSoup(link_contents, features="html.parser")
        sleep(2)
        target = link_soup.find("span", attrs={'id': 'titletextonly'})
        info['title'] = target.text
        print(info['title'])
        info['info'] = link_soup.find('section', attrs={'id': 'postingbody'}).text
        target = link_soup.find('p', attrs={'class': 'attrgroup'})
        info['compensation'] = target.findAll('b')[0].text
        info['job_type'] = target.findAll('b')[1].text
        try:
            link_driver.find_element_by_class_name('reply-button').click()
            sleep(15)
            info_contents = link_driver.page_source
            info_soup = BeautifulSoup(info_contents, features="html.parser")
            a = info_soup.find('a', attrs={'class': 'mailapp'})
            info['email'] = a.text
        except:
            pass
        try:
            link_driver.find_element_by_class_name('show-phone').click()
            sleep(10)
            info_contents = link_driver.page_source
            info_soup = BeautifulSoup(info_contents, features="html.parser")
            info['phone'] = info_soup.find('span',attrs = {'id' : 'reply-tel-number'}).text
            print(info['phone'])
        except:
            pass
        data[j] = info
        j += 1
        i += 1
        link_driver.close()
        if i == 16:
            break

    driver.close()
    data =  json.dumps(data)
    try:
        connection = mysql.connector.connect(host='localhost',
                                            database='shanaya',
                                            user='root',
                                            password='')

        cursor = connection.cursor()
        cursor.execute('INSERT INTO scrape_info (id,website_url,data) VALUES (%s,%s,%s)',(uid,url,data))
        connection.commit()
        print(cursor.rowcount, "Record inserted successfully into table")
        cursor.close()

    except mysql.connector.Error as error:
        print("Failed to insert record into Laptop table {}".format(error))

    finally:
        if (connection.is_connected()):
            connection.close()
            print("MySQL connection is closed")

if __name__ == '__main__':
    application.run(host="0.0.0.0",port = 1234,debug=True)
