cat index.html | grep -v '<script' | sed -e 's/<\/head>/  <script type="text\/javascript" src="min.js"><\/script>\n  <\/head>/' > min.html
#cat index.html | grep -v '<script type="text/javascript" src="js' | sed -e 's/<\/head>/  <script type="text\/javascript" src="min.js"><\/script>\n  <\/head>/' > min.html
