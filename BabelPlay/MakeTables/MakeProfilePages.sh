for i in *.txt

do

echo "<html><img border="0" src="$i" alt="$i"></img><body>" > $i.html
cat $i >> $i.html
echo "</body></html>" >> $i.html

done
