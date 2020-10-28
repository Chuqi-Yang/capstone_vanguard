from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
import time
import pandas as pd

ETF_name_list = []
ETF_ticker_list = []
ETF_segment_list = []
ETF_issuer_list = []

url = 'https://www.etf.com/etfanalytics/etf-finder/?sfilters=eyJhc3NldENsYXNzIjp7ImluIjpbIkFsdGVybmF0aXZlcyIsIkFzc2V0IEFsbG9jYXRpb24iLCJDb21tb2RpdGllcyIsIkN1cnJlbmN5IiwiRXF1aXR5IiwiRml4ZWQgSW5jb21lIl0sIm9yZGVyIjowfX0='

driver = webdriver.Chrome("/Users/nessyliu/Desktop/capstone/chromedriver")
driver.get(url)

time.sleep(10)
driver.execute_script("window.scrollTo(0, 950)") # scroll down to see the "next page" button

for page in range(1, 236): # the first 235 pages, each page contains 10 items
    print(page)
    for i in range(1,11):
        ticker = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[1]').text
        name = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[2]').text
        segment = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[3]').text
        issuer = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[4]').text
        ETF_name_list.append(name)
        ETF_ticker_list.append(ticker)
        ETF_segment_list.append(segment)
        ETF_issuer_list.append(issuer)
    driver.find_element_by_xpath('//*[@id="nextPage"]').click()  # click the 'next page' button
    time.sleep(0.5)


# for the last page (page 236), only 7 items
for i in range(1,8):
    ticker = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[1]').text
    name = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[2]').text
    segment = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[3]').text
    issuer = driver.find_element_by_xpath('//*[@id="finderTable"]/tbody/tr[' + str(i) + ']/td[4]').text
    ETF_name_list.append(name)
    ETF_ticker_list.append(ticker)
    ETF_segment_list.append(segment)
    ETF_issuer_list.append(issuer)

ETF_df = pd.DataFrame({
    'ticker': ETF_ticker_list,
    'name': ETF_name_list,
    'segment': ETF_segment_list,
    'issuer': ETF_issuer_list
})


ETF_df.to_csv('/Users/nessyliu/Desktop/capstone/output/crawled_ETF_info.csv')



