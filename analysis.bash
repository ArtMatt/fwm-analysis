echo Whos This
#read SITE
SITE=`cat site.txt`


#mkdir $SITE
searchurl="http://www.google.com/search?q=site:$SITE"

curl -s www.$SITE > temp/site.html
curl -s www.$SITE/robots.txt > temp/robots.html
curl -s www.$SITE/sitemap.xml > temp/sitemap.xml
curl -s www.$SITE/jkhgjshrg > temp/four0hfour.txt
curl -A Mozilla $searchurl > temp/googleserp.html


sed 's/opyright...../\n&\n/g' temp/site.html > temp/copyright1.txt
sed 's/opyright...../!d' temp/copyright1.txt > temp/copyright11.txt

sed  's/©...../\n&\n/g' temp/site.html > temp/copyright2.txt
sed  '/©/!d' temp/copyright2.txt > temp/copyright22.txt

sed  's/\&copy;...../\n&\n/g' temp/site.html > temp/copyright3.txt
sed  '/\&copy;...../!d' temp/copyright3.txt > temp/copyright33.txt


echo
echo copyright 1?
head -n 1 temp/copyright11.txt
echo copyright 2?
head -n 1 temp/copyright22.txt
echo copyright 3?
head -n 1 temp/copyright33.txt


echo
echo robots.txt code:
curl -I http://www.$SITE/robots.txt 2>/dev/null | head -n 1 | cut -d$' ' -f2

echo
echo robots.txt mentions sitemap?
sed /sitemap/!d temp/robots.html > temp/robots2.html
robotexist=`wc -l temp/robots2.html`
if [ -z "$robotexist" ]
then
echo no sitemap in robots.txt
else 
echo robots.txt has sitemap!! 
fi

#echo
#echo robots has sitemap?
#robotsitemap=`cat robots2.html`
#if [ -z "$robotsitemap" ]
#then
#echo no sitemap in robots.txt!
#else
#echo robots.txt has sitemap!
#fi

echo
echo sitemap?
sitemap=`cat temp/sitemap.xml`
if [ -z "$sitemap" ]
then
echo no sitemap!
else 
echo sitemap present!
fi

echo
echo favicon?
sed 's/shortcut icon/\n&\n/g' temp/site.html > temp/favicon.txt
sed '/shortcut icon/!d' temp/favicon.txt

echo
echo 404 page?!
wc -l temp/four0hfour.txt

echo
echo FORMS?!

echo
echo Indexed on google?!
sed 's/......results/\n&\n/g' temp/googleserp.html > temp/serp2.html
sed '/......results/!d' temp/serp2.html > temp/serp3.html
sed '/[0-9]/!d' temp/serp3.html > temp/serp4.html
cat temp/serp4.html

echo
python MetaHeadPrinter.py
python AltTagPrinter.py
