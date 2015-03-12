from bs4 import BeautifulSoup
soup = BeautifulSoup(open("temp/site.html"))

array = []

for img in soup.find_all('img'):
  alt = img.get('alt')
  array.append(alt)

print array
