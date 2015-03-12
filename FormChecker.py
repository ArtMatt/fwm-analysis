from bs4 import BeautifulSoup
soup = BeautifulSoup(open('site.html'))

print "Title: "
print soup.title.string
print " "
print "Meta Description: "
print soup.find("meta", {"name":"description"})['content']
print " " 
for head in soup.find_all('h1'):
  print soup.h1
