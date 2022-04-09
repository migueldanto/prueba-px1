#!/bin/bash

#los urls quedan /../../static/web-assets/css/app.3e7d65e5.css

#deberian poder transformarse  a /static/web-assets/css/app.3e7d65e5.css
search='\/..\/..\/static'
replace='\/static'
filename="../web/templates/web/index.html"

sed -i "s/$search/$replace/g" $filename