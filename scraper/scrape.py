from selenium import webdriver
from bs4 import BeautifulSoup
from time import sleep
import json

driver = webdriver.Chrome('./driver/chromedriver')
driver.get('https://pune.craigslist.org/d/jobs/search/jjj')
contents = driver.page_source
soup = BeautifulSoup(contents,features="html.parser")
sleep(2)
# info = {'email' : "", 'title': "", 'info' : "",'job_type' : "",'compensation': "",'time' : ''}
data = {}
i = 0
linklist = soup.find("ul",attrs ={'class': 'rows' })
for entry in linklist.findAll('li',attrs ={'class': 'result-row' }):
    info = {}
    a = entry.find('a',attrs ={'class': 'result-image' })
    link = a.attrs['href']
    link_driver = webdriver.Chrome('./driver/chromedriver')
    link_driver.get(link)
    sleep(2)
    link_contents = link_driver.page_source
    link_soup = BeautifulSoup(link_contents,features="html.parser")
    sleep(2)
    target = link_soup.find("span",attrs = {'id': 'titletextonly'})
    info['title'] = target.text
    print(info['title'])
    info['info'] = link_soup.find('section',attrs ={'id' : 'postingbody'}).text
    target = link_soup.find('p',attrs = {'class': 'attrgroup'})
    info['compensation'] = target.findAll('b')[0].text
    info['job_type'] = target.findAll('b')[1].text
    try:
        link_driver.find_element_by_class_name('reply-button').click()
        sleep(5)
        info_contents = link_driver.page_source
        info_soup = BeautifulSoup(info_contents,features="html.parser")
        info['email'] = info_soup.find('a',attrs= {'class':'mailapp'})
    except:
        pass
    try:
        link_driver.find_element_by_class_name('show-contact').click()
        sleep(5)
        info_contents = link_driver.page_source
        info_soup = BeautifulSoup(info_contents,features="html.parser")
        target = info_soup.find('section',attrs= {'class':'postingbody'})
        # info['phone'] = target.text[:-(target.text+11)]
        # print(info['phone'])
    except:
        pass
    i += 1
    data[i] = info
    link_driver.close()
    # if i == 1:
    #     break

with open('data.json','w') as file:
    file.write(json.dumps(data))
driver.close()
